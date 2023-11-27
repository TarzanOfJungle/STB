import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/groupchat/models/group_chat_message/group_chat_message.dart';
import 'package:split_the_bill/groupchat/models/post_group_chat_message/post_group_chat_message.dart';
import 'package:split_the_bill/groupchat/repositories/group_chat_repository_base.dart';

class GroupChatRepository implements GroupChatRepositoryBase {
  final ApiClientBase _apiClient;

  GroupChatRepository(this._apiClient);

  @override
  Future<List<GroupChatMessage>> getMessagesOfShopping(int shoppingId) {
    final fullPath = "${ApiConstants.shoppingMessages}/$shoppingId";
    return _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      processBody: (rawBody) {
        final json = rawBody.asJsonObjectArray();
        return json
            .map((jsonMessage) => GroupChatMessage.fromJson(jsonMessage))
            .toList();
      },
    );
  }

  @override
  Future<GroupChatMessage> postMessage(PostGroupChatMessage messagePost) {
    return _apiClient.sendDataRequest(
      path: ApiConstants.shoppingMessages,
      method: HttpMethod.post,
      jsonBody: messagePost.toJson(),
      processBody: (rawBody) {
        final jsonObject = rawBody.asJsonObject();
        return GroupChatMessage.fromJson(jsonObject);
      },
    );
  }

  @override
  Future<void> deleteMessage(int messageId) {
    final fullPath = "${ApiConstants.shoppingMessages}/$messageId";
    return _apiClient.sendRequest(
      path: fullPath,
      method: HttpMethod.delete,
    );
  }

  @override
  Stream<WebsocketEventWithData<GroupChatMessage>> getMessageChangesStream() {
    return _apiClient.listenForDataEvents(
      path: ApiConstants.shoppingMessagesStream,
      events: [
        WebsocketEvent.groupchatMessageReceived,
        WebsocketEvent.groupchatMessageDeleted,
      ],
      processEventData: (rawData) {
        final jsonObject = rawData.asJsonObject();
        return GroupChatMessage.fromJson(jsonObject);
      },
    );
  }
}
