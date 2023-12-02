import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/products/models/product/product.dart';
import 'package:split_the_bill/products/repositories/products_repository_base.dart';

class ProductsRepository implements ProductsRepositoryBase {
  final ApiClientBase _apiClient;

  const ProductsRepository(this._apiClient);

  @override
  Future<List<Product>> getProducts({
    String? name,
    int? shoppingId,
    int? creatorId,
  }) async {
    final Map<String, String> queryParameters = {};

    if (name != null) {
      queryParameters["nameFilter"] = name;
    }
    if (shoppingId != null) {
      queryParameters["shoppingId"] = shoppingId.toString();
    }
    if (creatorId != null) {
      queryParameters["creatorId"] = creatorId.toString();
    }

    return await _apiClient.sendDataRequest(
      path: ApiConstants.products,
      method: HttpMethod.get,
      queryParams: queryParameters,
      processBody: (rawBody) {
        final jsonArray = rawBody.asJsonObjectArray();
        return jsonArray.map((product) => Product.fromJson(product)).toList();
      },
    );
  }
}
