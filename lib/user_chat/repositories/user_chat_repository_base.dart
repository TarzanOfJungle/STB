import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/user_chat/models/post_user_chat_message/post_user_chat_message.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message/user_chat_message.dart';

abstract class UserChatRepositoryBase {
  Future<List<UserChatMessage>> getChatMessagesWithUser(int userId);
  Future<UserChatMessage> postMessage(PostUserChatMessage messagePost);
  Future<void> deleteMessage(int userChatMessageId);

  Stream<WebsocketEventWithData<UserChatMessage>> getUserChatMessageChanges();
}