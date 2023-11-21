// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_shopping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostShoppingImpl _$$PostShoppingImplFromJson(Map<String, dynamic> json) =>
    _$PostShoppingImpl(
      name: json['name'] as String,
      dueDateTime: json['dueDateTime'] == null
          ? null
          : DateTime.parse(json['dueDateTime'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PostShoppingImplToJson(_$PostShoppingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dueDateTime': instance.dueDateTime?.toIso8601String(),
      'description': instance.description,
    };
