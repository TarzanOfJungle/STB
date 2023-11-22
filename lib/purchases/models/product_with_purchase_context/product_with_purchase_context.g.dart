// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_with_purchase_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductWithPurchaseContextImpl _$$ProductWithPurchaseContextImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductWithPurchaseContextImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductWithPurchaseContextImplToJson(
        _$ProductWithPurchaseContextImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
    };
