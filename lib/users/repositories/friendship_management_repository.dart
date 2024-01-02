import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/users/models/friendship_request_status.dart';
import 'package:split_the_bill/users/models/friendship_management_update/friendship_management_update.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/post_friendship_request/post_friendship_request.dart';
import 'package:split_the_bill/users/models/update_friendship_request_status/update_friendship_request_status.dart';
import 'package:split_the_bill/users/repositories/friendship_management_repository_base.dart';

class FriendshipManagementRepository
    implements FriendshipManagementRepositoryBase {
  final ApiClientBase _apiClient;
  const FriendshipManagementRepository(this._apiClient);

  @override
  Future<List<FriendshipRequest>> getFriendshipRequests({
    FriendshipRequestStatus status = FriendshipRequestStatus.PENDING,
  }) {
    return _apiClient.sendDataRequest(
      path: ApiConstants.friendshipRequests,
      method: HttpMethod.get,
      queryParams: {"status": status.statusCode.toString()},
      processBody: (rawBody) {
        final jsonArray = rawBody.asJsonObjectArray();
        return jsonArray
            .map((request) => FriendshipRequest.fromJson(request))
            .toList();
      },
    );
  }

  @override
  Future<void> createFriendshipRequest(PostFriendshipRequest postRequest) {
    return _apiClient.sendRequest(
      path: ApiConstants.friendshipRequests,
      method: HttpMethod.post,
      jsonBody: postRequest.toJson(),
    );
  }

  @override
  Future<void> updateFriendshipRequestStatus(
      UpdateFriendshipRequestStatus putRequest) {
    return _apiClient.sendRequest(
      path: ApiConstants.friendshipRequests,
      method: HttpMethod.put,
      jsonBody: putRequest.toJson(),
    );
  }

  @override
  Future<void> cancelFriendshipRequest(int pendingAcceptantUserId) {
    final fullPath =
        "${ApiConstants.friendshipRequests}/$pendingAcceptantUserId";
    return _apiClient.sendRequest(
      path: fullPath,
      method: HttpMethod.delete,
    );
  }

  @override
  Future<void> deleteExistingFriendship(int friendUserId) {
    final fullPath = "${ApiConstants.friendships}/$friendUserId";
    return _apiClient.sendRequest(
      path: fullPath,
      method: HttpMethod.delete,
    );
  }

  @override
  Stream<WebsocketEventWithData<FriendshipManagementUpdate>>
      getFriendshipManagementChangesStream() {
    return _apiClient.listenForDataEvents(
      path: ApiConstants.friendshipManagementChangesStream,
      events: [
        WebsocketEvent.friendshipRequestCreated,
        WebsocketEvent.friendshipRequestStatusUpdated,
        WebsocketEvent.friendshipRequestDeleted,
        WebsocketEvent.friendshipDeleted,
      ],
      processEventData: (rawData) =>
          FriendshipManagementUpdate.fromJson(rawData.asJsonObject()),
    );
  }
}
