// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthenticatedUserAdapter extends TypeAdapter<AuthenticatedUser> {
  @override
  final int typeId = 0;

  @override
  AuthenticatedUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthenticatedUser(
      id: fields[1] as int,
      email: fields[2] as String,
      username: fields[3] as String,
      token: fields[4] as String,
      created: fields[5] as DateTime,
      updated: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AuthenticatedUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.token)
      ..writeByte(5)
      ..write(obj.created)
      ..writeByte(6)
      ..write(obj.updated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticatedUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticatedUserImpl _$$AuthenticatedUserImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticatedUserImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      token: json['token'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$$AuthenticatedUserImplToJson(
        _$AuthenticatedUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'token': instance.token,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };
