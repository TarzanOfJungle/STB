// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingImpl _$$ShoppingImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      creatorId: json['creatorId'] as int,
      description: json['description'] as String?,
      due: json['dueDateTime'] == null
          ? null
          : DateTime.parse(json['dueDateTime'] as String),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$$ShoppingImplToJson(_$ShoppingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creatorId': instance.creatorId,
      'description': instance.description,
      'dueDateTime': instance.due?.toIso8601String(),
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
