// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostUserChatMessageImpl _$$PostUserChatMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$PostUserChatMessageImpl(
      receiverId: json['receiverId'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$PostUserChatMessageImplToJson(
        _$PostUserChatMessageImpl instance) =>
    <String, dynamic>{
      'receiverId': instance.receiverId,
      'message': instance.message,
    };
