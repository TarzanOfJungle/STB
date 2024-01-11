import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/datetime_convert_extension.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/home/models/stat_shopping_purchases/stat_shopping_purchases.dart';
import 'package:split_the_bill/home/repositories/statistics_repository_base.dart';

class StatisticsRepository implements StatisticsRepositoryBase {
  final ApiClientBase _apiClient;

  const StatisticsRepository(this._apiClient);

  @override
  Future<List<StatShoppingPurchases>> getPurchaseStatistics({
    required DateTime from,
    required DateTime to,
    bool useDaysOnly = true,
  }) async {
    const fullPath = "${ApiConstants.statistics}/purchases";
    var fromString = from.toApiCompatibleString();
    var toString = to.toApiCompatibleString();
    if (useDaysOnly) {
      fromString =
          from.copyWith(hour: 0, minute: 0, second: 0).toApiCompatibleString();
      toString =
          to.copyWith(hour: 23, minute: 59, second: 59).toApiCompatibleString();
    }
    return await _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      queryParams: {
        "from": fromString,
        "to": toString,
      },
      processBody: (rawBody) {
        final jsonArray = rawBody.asJsonObjectArray();
        return jsonArray
            .map((shoppingStat) => StatShoppingPurchases.fromJson(shoppingStat))
            .toList();
      },
    );
  }
}
