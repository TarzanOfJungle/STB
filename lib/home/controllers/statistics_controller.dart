import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/home/models/stat_shopping_purchases/stat_shopping_purchases.dart';
import 'package:split_the_bill/home/repositories/statistics_repository_base.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';

class StatisticsController {
  final BehaviorSubject<int> _selectedYear =
      BehaviorSubject.seeded(DateTime.now().year);

  Stream<List<StatShoppingPurchases>> get _rawStatistics => _selectedYear
      .asyncMap((selectedYear) => _getYearlyStatistics(selectedYear));

  Stream<Map<int, double>> get userMonthlySpending =>
      _rawStatistics.map((statistics) => _getUserMonthlyStatistics(statistics));

  Stream<Map<int, double>> get userSpendingPerShopping => _rawStatistics
      .map((statistics) => _getUserSpendingPerShoppingId(statistics));

  AuthenticatedUser? get _loggedInUser => _authController.loggedInUser;

  final AuthController _authController;
  final StatisticsRepositoryBase _statisticsRepository;
  final ShoppingsListRepositoryBase _shoppingsRepository;

  StatisticsController(
    this._authController,
    this._statisticsRepository,
    this._shoppingsRepository,
  );

  Future<List<StatShoppingPurchases>> _getYearlyStatistics(int year) async {
    try {
      final start = DateTime(year, 1, 1);
      final end = DateTime(year, 12, 31);
      return await _statisticsRepository.getPurchaseStatistics(
          from: start, to: end);
    } catch (_) {
      return [];
    }
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

    final spendingEntries = rawStatistics.map(
      (shoppingStatistic) {
        return MapEntry(
          shoppingStatistic.shoppingId,
          shoppingStatistic.userPurchases
              .where((userPurchase) => userPurchase.userId == _loggedInUser!.id)
              .fold(
                  0.0,
                  (prev, userPurchase) =>
                      prev + userPurchase.totalAmmountSpentByUser),
        );
      },
    ).toList();

    return Map.fromEntries(spendingEntries);
  }
}
