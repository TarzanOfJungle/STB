// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_product_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PutProductPurchaseImpl _$$PutProductPurchaseImplFromJson(
        Map<String, dynamic> json) =>
    _$PutProductPurchaseImpl(
      shoppingId: json['shoppingId'] as int,
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$PutProductPurchaseImplToJson(
        _$PutProductPurchaseImpl instance) =>
    <String, dynamic>{
      'shoppingId': instance.shoppingId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
    };
