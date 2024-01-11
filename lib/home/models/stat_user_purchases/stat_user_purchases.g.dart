// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_user_purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatUserPurchasesImpl _$$StatUserPurchasesImplFromJson(
        Map<String, dynamic> json) =>
    _$StatUserPurchasesImpl(
      userId: json['userId'] as int,
      productPurchases: (json['productPurchases'] as List<dynamic>)
          .map((e) => StatProductPurchase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StatUserPurchasesImplToJson(
        _$StatUserPurchasesImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productPurchases': instance.productPurchases,
    };
