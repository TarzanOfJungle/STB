// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPurchaseImpl _$$ProductPurchaseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPurchaseImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      totalQuantityToBePurchased: json['totalQuantityToBePurchased'] as int,
      userPurchases: (json['userPurchases'] as List<dynamic>)
          .map((e) =>
              UserWithPurchaseContext.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductPurchaseImplToJson(
        _$ProductPurchaseImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'totalQuantityToBePurchased': instance.totalQuantityToBePurchased,
      'userPurchases': instance.userPurchases,
    };
