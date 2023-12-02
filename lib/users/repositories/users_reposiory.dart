import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/users/models/update_user/put_user.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/models/user_shopping_assignment/user_shopping_assignment.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

class UsersRepository implements UsersRepositoryBase {
  final ApiClientBase _apiClient;

  const UsersRepository(this._apiClient);

  @override
  Future<List<User>> getUsers({
    String? searchQuery,
    int? shoppingId,
    bool includeSelf = true,
  }) {
    final Map<String, String> queryParameters = {
      "includeSelf": includeSelf.toString()
    };
    if (searchQuery != null) {
      queryParameters["filter"] = searchQuery;
    }
    if (shoppingId != null) {
      queryParameters["shoppingId"] = shoppingId.toString();
    }

    return _apiClient.sendDataRequest(
      path: ApiConstants.users,
      method: HttpMethod.get,
      queryParams: queryParameters,
      processBody: (rawBody) {
        final jsonArray = rawBody.asJsonObjectArray();
        return jsonArray.map((user) => User.fromJson(user)).toList();
      },
    );
  }

  @override
  Future<User> getUserById(int id) {
    final fullPath = "${ApiConstants.users}/$id";
    return _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      processBody: (rawBody) => User.fromJson(rawBody.asJsonObject()),
    );
  }

  @override
  Future<User> updateUser(PutUser userPut) {
    return _apiClient.sendDataRequest(
      path: ApiConstants.users,
      method: HttpMethod.put,
      jsonBody: userPut.toJson(),
      processBody: (rawBody) => User.fromJson(rawBody.asJsonObject()),
    );
  }

  @override
  Stream<WebsocketEventWithData<UserShoppingAssignment>>
      getUserShoppingAssignmentChangesStream() {
    return _apiClient.listenForDataEvents(
      path: ApiConstants.userShoppingAssignmentChangesStream,
      events: [
        WebsocketEvent.userAssigned,
        WebsocketEvent.userUnassigned,
      ],
      processEventData: (rawData) =>
          UserShoppingAssignment.fromJson(rawData.asJsonObject()),
    );
  }

  @override
  Future<void> assignUserToShopping({
    required int userId,
    required int shoppingId,
  }) {
    return _apiClient.sendRequest(
      path: ApiConstants.userToShoppingAssignment,
      method: HttpMethod.post,
      queryParams: {
        "userId": userId.toString(),
        "shoppingId": shoppingId.toString(),
      },
    );
  }

  @override
  Future<void> unassignUserFromShopping({
    required int userId,
    required int shoppingId,
  }) {
    return _apiClient.sendRequest(
      path: ApiConstants.userToShoppingAssignment,
      method: HttpMethod.delete,
      queryParams: {
        "userId": userId.toString(),
        "shoppingId": shoppingId.toString(),
      },
    );
  }
}
