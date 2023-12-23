import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
import 'package:split_the_bill/groupchat/models/groupchat_message/groupchat_message.dart';
import 'package:split_the_bill/groupchat/models/post_groupchat_message/post_groupchat_message.dart';
import 'package:split_the_bill/groupchat/repositories/groupchat_repository_base.dart';

class GroupchatRepository implements GroupchatRepositoryBase {
  final ApiClientBase _apiClient;

  GroupchatRepository(this._apiClient);

  @override
  Future<List<GroupchatMessage>> getMessagesOfShopping(int shoppingId) {
    final fullPath = "${ApiConstants.shoppingMessages}/$shoppingId";
    return _apiClient.sendDataRequest(
      path: fullPath,
      method: HttpMethod.get,
      processBody: (rawBody) {
        final json = rawBody.asJsonObjectArray();
        return json
            .map((jsonMessage) => GroupchatMessage.fromJson(jsonMessage))
            .toList();
      },
    );
  }

  @override
  Future<GroupchatMessage> postMessage(PostGroupchatMessage messagePost) {
    return _apiClient.sendDataRequest(
      path: ApiConstants.shoppingMessages,
      method: HttpMethod.post,
      jsonBody: messagePost.toJson(),
      processBody: (rawBody) {
        final jsonObject = rawBody.asJsonObject();
        return GroupchatMessage.fromJson(jsonObject);
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
  Stream<WebsocketEventWithData<GroupchatMessage>> getMessageChangesStream() {
    return _apiClient.listenForDataEvents(
      path: ApiConstants.shoppingMessagesStream,
      events: [
        WebsocketEvent.groupchatMessageReceived,
        WebsocketEvent.groupchatMessageDeleted,
      ],
      processEventData: (rawData) {
        final jsonObject = rawData.asJsonObject();
        return GroupchatMessage.fromJson(jsonObject);
      },
    );
  }
}
