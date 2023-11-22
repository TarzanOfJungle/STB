import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/put_product_purchase/put_product_purchase.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';

import '../../models/user_purchases/user_purchases.dart';

class ProductPurchasesRepository implements ProductPurchasesRepositoryBase {
  final ApiClientBase _apiClient;

  const ProductPurchasesRepository(this._apiClient);

  @override
  Future<void> addOrUpdateProductPurchase(
      PutProductPurchase productPurchase) async {
    await _apiClient.sendRequest(
      path: ApiConstants.purchases,
      method: HttpMethod.put,
      jsonBody: productPurchase.toJson(),
    );
  }

  @override
  Future<void> deleteProductPurchase(int shoppingId, int productId) async {
    await _apiClient.sendRequest(
      path: ApiConstants.purchases,
      method: HttpMethod.delete,
      queryParams: {
        'productId': productId.toString(),
        'shoppingId': shoppingId.toString(),
      },
    );
  }

  @override
  Future<List<ProductPurchase>> getProductPurchasesOfShopping(
    int shoppingId,
  ) async {
    final fullPath = "${ApiConstants.productPurchases}/$shoppingId";
    final productPurchases = await _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      processBody: (rawBody) {
        final jsonArray = rawBody.asJsonObjectArray();
        return jsonArray.map((item) => ProductPurchase.fromJson(item)).toList();
      },
    );

    return productPurchases;
  }

  @override
  Future<List<UserPurchases>> getUserPurchasesOfShopping(int shoppingId) async {
    final fullPath = "${ApiConstants.productPurchases}/$shoppingId";
    final userPurchases = await _apiClient.sendDataRequest(
        path: fullPath,
        method: HttpMethod.get,
        processBody: (rawBody) {
          final jsonArray = rawBody.asJsonObjectArray();
          return jsonArray.map((item) => UserPurchases.fromJson(item)).toList();
        },
    );
    return userPurchases;
  }
}
