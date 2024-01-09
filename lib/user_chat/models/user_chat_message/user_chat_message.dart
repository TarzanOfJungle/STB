import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_chat_message.freezed.dart';
part 'user_chat_message.g.dart';

@freezed
class UserChatMessage with _$UserChatMessage {
  const factory UserChatMessage({
    required int id,
    required int senderId,
    required int receiverId,
    required String message,
    required DateTime created,
  }) = _UserChatMessage;

  const UserChatMessage._();

  factory UserChatMessage.fromJson(Map<String, Object?> json) =>
      _$UserChatMessageFromJson(json);

}