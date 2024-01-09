import 'package:split_the_bill/user_chat/models/user_chat_message/user_chat_message.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class UserChatMessageWithUsers {
  final UserChatMessage message;
  final User sender;
  final User receiver;

  UserChatMessageWithUsers({
    required this.message,
    required this.sender,
    required this.receiver,
  });
}
