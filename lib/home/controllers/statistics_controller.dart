import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/home/models/shopping_with_spending.dart';
import 'package:split_the_bill/home/models/stat_shopping_purchases/stat_shopping_purchases.dart';
import 'package:split_the_bill/home/repositories/statistics_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';

class StatisticsController with AuthenticatedSocketObserver {
  final BehaviorSubject<int> _selectedYear =
      BehaviorSubject.seeded(DateTime.now().year);

  final BehaviorSubject<List<ShoppingWithContext>> _allUserShoppings =
      BehaviorSubject.seeded([]);

  Stream<List<StatShoppingPurchases>> get _rawStatistics => _selectedYear
      .asyncMap((selectedYear) => _getRawYearlyStatistics(selectedYear));

  int get selectedYear => _selectedYear.value;

  List<int> get activeYears => _getLoggedInUserActiveYears();

  Stream<Map<int, double>> get userMonthlySpending =>
      _rawStatistics.map((statistics) => _getUserMonthlyStatistics(statistics));

  Stream<Map<int, double>> get _userSpendingPerShoppingId => _rawStatistics
      .map((statistics) => _getUserSpendingPerShoppingId(statistics));

  Stream<List<ShoppingWithSpending>> get perShoppingSpending =>
      Rx.combineLatest2(
        _allUserShoppings.stream,
        _userSpendingPerShoppingId,
        (shoppings, spendings) =>
            _getPerShoppingSpendings(spendings, shoppings),
      );

  AuthenticatedUser? get _loggedInUser => _authController.loggedInUser;

  final AuthController _authController;
  final StatisticsRepositoryBase _statisticsRepository;
  final ShoppingsListRepositoryBase _shoppingsRepository;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;

  StatisticsController(
    this._authController,
    this._statisticsRepository,
    this._shoppingsRepository,
    this._productPurchasesRepository,
  ) {
    _listenForLoggedInUserChanges();
    _listenForStatisticsDataUpdates();
  }

  void _listenForLoggedInUserChanges() {
    _authController.loggedInUserStream.listen((loggedInUser) {
      if (loggedInUser != null) {
        _updateStatistics();
        _loadShoppings();
      }
    });
  }

  void _listenForStatisticsDataUpdates() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream: _shoppingsRepository.getShoppingChangesStream,
      onValueChanged: (assignmentEvent) {
        _loadShoppings();
      },
    );
    observeSocketEvents(
      eventStream: _productPurchasesRepository.getPurchaseChangesStream,
      onValueChanged: (assignmentEvent) {
        _updateStatistics();
      },
    );
  }

  void setSelectedYear(int year) {
    _selectedYear.add(year);
  }

  List<int> _getLoggedInUserActiveYears() {
    if (_authController.loggedInUser == null) {
      return [];
    }
    final currentYear = DateTime.now().year;
    final firstUserYear = _authController.loggedInUser!.created.year;
    final numberOfUserYears = (currentYear - firstUserYear) + 1;
    final List<int> activeUserYears = [];
    for (var i = 0; i < numberOfUserYears; i++) {
      final yearToAdd = currentYear - i;
      activeUserYears.add(yearToAdd);
    }
    return activeUserYears;
  }

  void _updateStatistics() {
    final year = _selectedYear.value;
    _selectedYear.add(year);
  }

  Future<List<StatShoppingPurchases>> _getRawYearlyStatistics(int year) async {
    try {
      final start = DateTime(year, 1, 1);
      final end = DateTime(year, 12, 31);
      return await _statisticsRepository.getPurchaseStatistics(
          from: start, to: end);
    } catch (_) {
      return [];
    }
  }

  Future<void> _loadShoppings() async {
    try {
      final shoppings = await _shoppingsRepository.getShoppings();
      _allUserShoppings.add(shoppings.toList());
    } catch (_) {}
  }

  Map<int, double> _getUserMonthlyStatistics(
    List<StatShoppingPurchases> rawStatistics,
  ) {
    if (_loggedInUser == null) {
      return {};
    }
    final Map<int, double> monthlyStatistics = {};
    final userRawStatistics = rawStatistics
        .expand((shoppingStatistic) => shoppingStatistic.userPurchases)
        .where((userPurchase) => userPurchase.userId == _loggedInUser!.id);

    final productPurchases = userRawStatistics
        .expand((userStatistic) => userStatistic.productPurchases)
        .toList();

    for (var i = 1; i <= 12; i++) {
      final monthPurchases = productPurchases
          .where((productPurchase) => productPurchase.updated.month == i);

      monthlyStatistics[i] = monthPurchases.fold(
          0, (prev, purchase) => prev + purchase.purchasedAmmount);
    }

    return monthlyStatistics;
  }

  Map<int, double> _getUserSpendingPerShoppingId(
    List<StatShoppingPurchases> rawStatistics,
  ) {
    if (_loggedInUser == null) {
      return {};
    }
    final spendingEntries = rawStatistics
        .map(
          (shoppingStatistic) {
            return MapEntry(
              shoppingStatistic.shoppingId,
              shoppingStatistic.userPurchases
                  .where((userPurchase) =>
                      userPurchase.userId == _loggedInUser!.id)
                  .fold(
                      0.0,
                      (prev, userPurchase) =>
                          prev + userPurchase.totalAmmountSpentByUser),
            );
          },
        )
        .toList()
        .where((entry) => entry.value > 0);

    return Map.fromEntries(spendingEntries);
  }

  List<ShoppingWithSpending> _getPerShoppingSpendings(
    Map<int, double> spendingsPerShoppingId,
    List<ShoppingWithContext> shoppings,
  ) {
    final List<ShoppingWithSpending> perShoppingSpendings = [];
    spendingsPerShoppingId.forEach((shoppingId, spent) {
      final shopping =
          shoppings.where((s) => s.shopping.id == shoppingId).firstOrNull;
      if (shopping != null) {
        perShoppingSpendings
            .add(ShoppingWithSpending(shopping: shopping, spending: spent));
      }
    });
    return perShoppingSpendings;
  }
}
