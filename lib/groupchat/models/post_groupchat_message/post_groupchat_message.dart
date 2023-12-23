import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_groupchat_message.freezed.dart';
part 'post_groupchat_message.g.dart';

@freezed
class PostGroupchatMessage with _$PostGroupchatMessage {
  const factory PostGroupchatMessage({
    required int shoppingId,
    required String message,
  }) = _PostGroupchatMessage;

  const PostGroupchatMessage._();

  factory PostGroupchatMessage.fromJson(Map<String, Object?> json) =>
      _$PostGroupchatMessageFromJson(json);
}