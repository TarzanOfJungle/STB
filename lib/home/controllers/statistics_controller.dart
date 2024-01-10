import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/home/models/stat_shopping_purchases/stat_shopping_purchases.dart';
import 'package:split_the_bill/home/repositories/statistics_repository_base.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';

class StatisticsController {
  final BehaviorSubject<int> _selectedYear =
      BehaviorSubject.seeded(DateTime.now().year);

  Stream<List<StatShoppingPurchases>> get _rawStatistics => _selectedYear
      .asyncMap((selectedYear) => _getYearlyStatistics(selectedYear));

  final StatisticsRepositoryBase _statisticsRepository;
  final ShoppingsListRepositoryBase _shoppingsRepository;

  StatisticsController(
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
}
