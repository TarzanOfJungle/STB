import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';

import '../../common/api/api_client_base.dart';
import '../../common/api/http_method.dart';
import '../../common/constants/api_constants.dart';

class TrasactionsRepository implements TrasactionsRepositoryBase {
  final ApiClientBase _apiClient;

  TrasactionsRepository(this._apiClient);

  @override
  Future<List<Transaction>> getTransactionsOfShopping(
      {required int shoppingId}) async {
    final transactions = await _apiClient.sendDataRequest(
        path: '${ApiConstants.paymentEvaluation}/$shoppingId',
        method: HttpMethod.get,
        processBody: (String rawBody) {
          final transactionsJson = rawBody.asJsonObjectArray();
          return transactionsJson.map((e) => Transaction.fromJson(e)).toList();
        });
    return transactions;
  }
}
