// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_with_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingWithContextImpl _$$ShoppingWithContextImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingWithContextImpl(
      shopping: Shopping.fromJson(json['shopping'] as Map<String, dynamic>),
      numberOfItems: json['numberOfItems'] as int,
      ammountSpent: (json['ammountSpent'] as num).toDouble(),
      numberOfParticipants: json['numberOfParticipants'] as int,
    );

Map<String, dynamic> _$$ShoppingWithContextImplToJson(
        _$ShoppingWithContextImpl instance) =>
    <String, dynamic>{
      'shopping': instance.shopping,
      'numberOfItems': instance.numberOfItems,
      'ammountSpent': instance.ammountSpent,
      'numberOfParticipants': instance.numberOfParticipants,
    };
