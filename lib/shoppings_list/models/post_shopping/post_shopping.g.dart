// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_shopping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostShoppingImpl _$$PostShoppingImplFromJson(Map<String, dynamic> json) =>
    _$PostShoppingImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      token: json['token'] as String,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$$PostShoppingImplToJson(_$PostShoppingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'token': instance.token,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
