// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_shopping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateShoppingImpl _$$UpdateShoppingImplFromJson(Map<String, dynamic> json) =>
    _$UpdateShoppingImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      finalized: json['finalized'] as bool?,
      updateDue: json['updateDueDateTime'] as bool? ?? false,
      due: json['dueDateTime'] == null
          ? null
          : DateTime.parse(json['dueDateTime'] as String),
      updateDescription: json['updateDescription'] as bool? ?? false,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UpdateShoppingImplToJson(
        _$UpdateShoppingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'finalized': instance.finalized,
      'updateDueDateTime': instance.updateDue,
      'dueDateTime': instance.due?.toIso8601String(),
      'updateDescription': instance.updateDescription,
      'description': instance.description,
    };
