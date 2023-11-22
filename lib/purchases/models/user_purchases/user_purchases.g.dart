// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPurchasesImpl _$$UserPurchasesImplFromJson(Map<String, dynamic> json) =>
    _$UserPurchasesImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      productPurchases: (json['productPurchases'] as List<dynamic>)
          .map((e) =>
              ProductWithPurchaseContext.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPurchasesImplToJson(_$UserPurchasesImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'productPurchases': instance.productPurchases,
    };
