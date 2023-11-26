import 'package:split_the_bill/groupchat/models/group_chat_message/group_chat_message.dart';
import 'package:split_the_bill/groupchat/models/post_group_chat_message/post_group_chat_message.dart';

abstract class GroupChatRepositoryBase {
  Future<List<GroupChatMessage>> getMessagesOfShopping(int shoppingId);
  Future<GroupChatMessage> postMessage(PostGroupChatMessage messagePost);
  Future<void> deleteMessage(int messageId);

  Stream<GroupChatMessage> getNewMessagesStream();
}