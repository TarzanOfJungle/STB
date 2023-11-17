// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_purchase_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWithPurchaseContextImpl _$$UserWithPurchaseContextImplFromJson(
        Map<String, dynamic> json) =>
    _$UserWithPurchaseContextImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserWithPurchaseContextImplToJson(
        _$UserWithPurchaseContextImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
    };
