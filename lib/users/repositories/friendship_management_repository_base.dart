import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/users/models/friendship_request_status.dart';
import 'package:split_the_bill/users/models/friendship_management_update/friendship_management_update.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/post_friendship_request/post_friendship_request.dart';
import 'package:split_the_bill/users/models/update_friendship_request_status/update_friendship_request_status.dart';

abstract class FriendshipManagementRepositoryBase {
  Future<List<FriendshipRequest>> getFriendshipRequests({
    FriendshipRequestStatus status = FriendshipRequestStatus.PENDING,
  });

  Future<void> createFriendshipRequest(PostFriendshipRequest postRequest);

  Future<void> updateFriendshipRequestStatus(UpdateFriendshipRequestStatus putRequest);

  Future<void> cancelFriendshipRequest(int pendingAcceptantUserId);

  Future<void> deleteExistingFriendship(int friendUserId);

  Stream<WebsocketEventWithData<FriendshipManagementUpdate>>
      getFriendshipManagementChangesStream();
}
