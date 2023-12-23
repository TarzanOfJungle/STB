import 'package:split_the_bill/groupchat/models/groupchat_message/groupchat_message.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class GroupchatMessageWithAuthor {
  final GroupchatMessage message;
  final User? author;

  GroupchatMessageWithAuthor({
    required this.message,
    this.author,
  });
}
