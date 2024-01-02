import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/shopping_detail/models/update_shopping/update_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/post_shopping/post_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';

class ShoppingsListRepository implements ShoppingsListRepositoryBase {
  final ApiClientBase _apiClient;

  const ShoppingsListRepository(this._apiClient);

  @override
  Future<List<ShoppingWithContext>> getShoppings({
    String? searchQuery,
    bool? finalized,
  }) async {
    final Map<String, String> queryParams = {};
    if (searchQuery != null) {
      queryParams["search"] = searchQuery;
    }
    if (finalized != null) {
      queryParams["finalized"] = finalized.toString();
    }
    final shoppingsList = await _apiClient.sendDataRequest(
      path: ApiConstants.shoppingsList,
      method: HttpMethod.get,
      queryParams: queryParams.isEmpty ? null : queryParams,
      processBody: (rawBody) {
        final listJson = rawBody.asJsonObjectArray();
        return listJson.map((e) => ShoppingWithContext.fromJson(e)).toList();
      },
    );
    return shoppingsList;
  }

  @override
  Future<ShoppingWithContext> addShopping(
      {required PostShopping postShopping}) async {
    final newShopping = await _apiClient.sendDataRequest(
      path: ApiConstants.shoppingsList,
      method: HttpMethod.post,
      jsonBody: postShopping.toJson(),
      processBody: (String rawBody) {
        final shoppingJson = rawBody.asJsonObject();
        return ShoppingWithContext.fromJson(shoppingJson);
      },
    );
    return newShopping;
  }

  @override
  Future<ShoppingWithContext> shoppingById({required int shoppingId}) async {
    final shopping = await _apiClient.sendDataRequest(
        path: '${ApiConstants.shoppingsList}/$shoppingId',
        method: HttpMethod.get,
        queryParams: {'shoppingId': '$shoppingId'},
        processBody: (String rawBody) {
          final shoppingJson = rawBody.asJsonObject();
          return ShoppingWithContext.fromJson(shoppingJson);
        });
    return shopping;
  }

  @override
  Future<bool> deleteShopping({required int shoppingId}) async {
    var status = await _apiClient.sendRequest(
      path: '${ApiConstants.shoppingsList}/$shoppingId',
      method: HttpMethod.delete,
      queryParams: {'shoppingId': '$shoppingId'},
    );
    return status == 200;
  }

  @override
  Future<ShoppingWithContext> updateShopping(
      {required UpdateShopping updateShopping}) async {
    var updatedShopping = await _apiClient.sendDataRequest(
        path: ApiConstants.shoppingsList,
        method: HttpMethod.put,
        jsonBody: updateShopping.toJson(),
        processBody: (String rawBody) {
          final shoppingJson = rawBody.asJsonObject();
          return ShoppingWithContext.fromJson(shoppingJson);
        });
    return updatedShopping;
  }

  @override
  Stream<WebsocketEventWithData<ShoppingWithContext>>
      getShoppingChangesStream() {
    return _apiClient.listenForDataEvents(
      path: ApiConstants.shoppingChangesStream,
      events: [
        WebsocketEvent.shoppingCreated,
        WebsocketEvent.shoppingUpdated,
        WebsocketEvent.shoppingDeleted,
      ],
      processEventData: (rawData) {
        return ShoppingWithContext.fromJson(rawData.asJsonObject());
      },
    );
  }
}
