import 'package:split_the_bill/home/models/stat_shopping_purchases/stat_shopping_purchases.dart';

abstract class StatisticsRepositoryBase {
  Future<List<StatShoppingPurchases>> getPurchaseStatistics({
    required DateTime from,
    required DateTime to,
    bool useDaysOnly = true,
  });
}
