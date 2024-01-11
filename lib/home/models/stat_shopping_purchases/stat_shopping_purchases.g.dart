// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_shopping_purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatShoppingPurchasesImpl _$$StatShoppingPurchasesImplFromJson(
        Map<String, dynamic> json) =>
    _$StatShoppingPurchasesImpl(
      shoppingId: json['shoppingId'] as int,
      userPurchases: (json['userPurchases'] as List<dynamic>)
          .map((e) => StatUserPurchases.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StatShoppingPurchasesImplToJson(
        _$StatShoppingPurchasesImpl instance) =>
    <String, dynamic>{
      'shoppingId': instance.shoppingId,
      'userPurchases': instance.userPurchases,
    };
