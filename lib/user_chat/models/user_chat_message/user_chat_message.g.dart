// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserChatMessageImpl _$$UserChatMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$UserChatMessageImpl(
      id: json['id'] as int,
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      message: json['message'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$UserChatMessageImplToJson(
        _$UserChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'message': instance.message,
      'created': instance.created.toIso8601String(),
    };
