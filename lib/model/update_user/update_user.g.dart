// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateUserImpl _$$UpdateUserImplFromJson(Map<String, dynamic> json) =>
    _$UpdateUserImpl(
      id: json['id'] as int,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$UpdateUserImplToJson(_$UpdateUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
