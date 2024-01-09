import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_user_chat_message.freezed.dart';
part 'post_user_chat_message.g.dart';

@freezed
class PostUserChatMessage with _$PostUserChatMessage {
  const factory PostUserChatMessage({
    required int receiverId,
    required String message,
  }) = _PostUserChatMessage;

  const PostUserChatMessage._();

  factory PostUserChatMessage.fromJson(Map<String, Object?> json) =>
      _$PostUserChatMessageFromJson(json);
}
