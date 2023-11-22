import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/put_product_shopping_assignment/put_product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';

class ProductAssignmentsRepository implements ProductAssignmentsRepositoryBase {
  final ApiClientBase _apiClient;

  const ProductAssignmentsRepository(this._apiClient);

  @override
  Future<ProductShoppingAssignment> addOrUpdateProductAssignment(
    PutProductShoppingAssignment putProductAssignment,
  ) async {
    final newAssignment = await _apiClient.sendDataRequest(
      path: ApiConstants.productShoppingAssignments,
      method: HttpMethod.put,
      jsonBody: putProductAssignment.toJson(),
      processBody: (rawBody) =>
          ProductShoppingAssignment.fromJson(rawBody.asJsonObject()),
    );
    return newAssignment;
  }

  @override
  Future<void> deleteProductAssignmentFromShopping(
    int shoppingId,
    String productName,
  ) async {
    await _apiClient.sendRequest(
      path: ApiConstants.productShoppingAssignments,
      method: HttpMethod.delete,
      queryParams: {
        'productName': productName,
        'shoppingId': shoppingId.toString(),
      },
    );
  }

  @override
  Future<List<ProductShoppingAssignment>> getProductAssignmentsOfShopping(
    int shoppingId,
  ) async {
    final fullPath = "${ApiConstants.productShoppingAssignments}/$shoppingId";
    final productAssignments = await _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      processBody: (rawBody) {
        final jsonArray = rawBody.asJsonObjectArray();
        return jsonArray
            .map((item) => ProductShoppingAssignment.fromJson(item))
            .toList();
      },
    );
    return productAssignments;
  }
}
