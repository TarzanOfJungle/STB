// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PutUserImpl _$$PutUserImplFromJson(Map<String, dynamic> json) =>
    _$PutUserImpl(
      id: json['id'] as int,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$PutUserImplToJson(_$PutUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
