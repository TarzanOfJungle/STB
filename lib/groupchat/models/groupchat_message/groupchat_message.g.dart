// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupchat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupchatMessageImpl _$$GroupchatMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupchatMessageImpl(
      id: json['id'] as int,
      userId: json['userId'] as int,
      shoppingId: json['shoppingId'] as int,
      message: json['message'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$$GroupchatMessageImplToJson(
        _$GroupchatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'shoppingId': instance.shoppingId,
      'message': instance.message,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
