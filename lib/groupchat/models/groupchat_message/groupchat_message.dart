
import 'package:freezed_annotation/freezed_annotation.dart';

part 'groupchat_message.freezed.dart';
part 'groupchat_message.g.dart';

@freezed
class GroupchatMessage with _$GroupchatMessage {
  const factory GroupchatMessage({
    required int id,
    required int userId,
    required int shoppingId,
    required String message,
    required DateTime created,
    DateTime? updated,
  }) = _GroupchatMessage;

  const GroupchatMessage._();

  factory GroupchatMessage.fromJson(Map<String, Object?> json) =>
      _$GroupchatMessageFromJson(json);

}