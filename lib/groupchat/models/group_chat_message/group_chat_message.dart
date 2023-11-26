
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_chat_message.freezed.dart';
part 'group_chat_message.g.dart';

@freezed
class GroupChatMessage with _$GroupChatMessage {
  const factory GroupChatMessage({
    required int id,
    required int userId,
    required int shoppingId,
    required String message,
    required DateTime created,
    DateTime? updated,
  }) = _GroupChatMessage;

  const GroupChatMessage._();

  factory GroupChatMessage.fromJson(Map<String, Object?> json) =>
      _$GroupChatMessageFromJson(json);

}