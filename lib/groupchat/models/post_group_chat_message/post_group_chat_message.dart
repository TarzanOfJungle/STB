import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_group_chat_message.freezed.dart';
part 'post_group_chat_message.g.dart';

@freezed
class PostGroupChatMessage with _$PostGroupChatMessage {
  const factory PostGroupChatMessage({
    required int shoppingId,
    required String message,
  }) = _PostGroupChatMessage;

  const PostGroupChatMessage._();

  factory PostGroupChatMessage.fromJson(Map<String, Object?> json) =>
      _$PostGroupChatMessageFromJson(json);
}