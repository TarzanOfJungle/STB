import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/groupchat/models/groupchat_message/groupchat_message.dart';
import 'package:split_the_bill/groupchat/models/post_groupchat_message/post_groupchat_message.dart';

abstract class GroupchatRepositoryBase {
  Future<List<GroupchatMessage>> getMessagesOfShopping(int shoppingId);
  Future<GroupchatMessage> postMessage(PostGroupchatMessage messagePost);
  Future<void> deleteMessage(int messageId);

  Stream<WebsocketEventWithData<GroupchatMessage>> getMessageChangesStream();
}