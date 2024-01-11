// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_product_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatProductPurchaseImpl _$$StatProductPurchaseImplFromJson(
        Map<String, dynamic> json) =>
    _$StatProductPurchaseImpl(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$$StatProductPurchaseImplToJson(
        _$StatProductPurchaseImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };
