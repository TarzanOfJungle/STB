import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/user_chat/models/post_user_chat_message/post_user_chat_message.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message/user_chat_message.dart';
import 'package:split_the_bill/user_chat/repositories/user_chat_repository_base.dart';

class UserChatRepository implements UserChatRepositoryBase {
  final ApiClientBase _apiClient;

  UserChatRepository(this._apiClient);

  @override
  Future<List<UserChatMessage>> getChatMessagesWithUser(int userId) {
    final fullPath = "${ApiConstants.userChatMessages}/$userId";
    return _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      processBody: (rawBody) {
        final json = rawBody.asJsonObjectArray();
        return json
            .map((jsonMessage) => UserChatMessage.fromJson(jsonMessage))
            .toList();
      },
    );
  }

  @override
  Future<UserChatMessage> postMessage(PostUserChatMessage messagePost) {
    return _apiClient.sendDataRequest(
      path: ApiConstants.userChatMessages,
      method: HttpMethod.post,
      jsonBody: messagePost.toJson(),
      processBody: (rawBody) {
        final jsonObject = rawBody.asJsonObject();
        return UserChatMessage.fromJson(jsonObject);
      },
    );
  }

  @override
  Future<void> deleteMessage(int userChatMessageId) {
    final fullPath = "${ApiConstants.userChatMessages}/$userChatMessageId";
    return _apiClient.sendRequest(
      path: fullPath,
      method: HttpMethod.delete,
    );
  }

  @override
  Stream<WebsocketEventWithData<UserChatMessage>> getUserChatMessageChanges() {
    return _apiClient.listenForDataEvents(
      path: ApiConstants.userChatMessageChangesStream,
      events: [
        WebsocketEvent.userChatMessageReceived,
        WebsocketEvent.userChatMessageDeleted,
      ],
      processEventData: (rawData) {
        final jsonObject = rawData.asJsonObject();
        return UserChatMessage.fromJson(jsonObject);
      },
    );
  }
}
