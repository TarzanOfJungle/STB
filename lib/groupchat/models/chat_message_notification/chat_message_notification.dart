import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_notification.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class ChatMessageNotification with _$ChatMessageNotification {
  const factory ChatMessageNotification({
    required int shoppingId,
    required int senderId,
    required String title,
    required String message,
  }) = _ChatMessageNotification;

  const ChatMessageNotification._();

  factory ChatMessageNotification.fromJson(Map<String, dynamic> json) {
    final shoppingId = int.parse(json["shoppingId"]);
    final senderId = int.parse(json["senderId"]);
    final title = json["title"];
    final message = json["message"];
    return ChatMessageNotification(
      shoppingId: shoppingId,
      senderId: senderId,
      title: title,
      message: message,
    );
  }
}
