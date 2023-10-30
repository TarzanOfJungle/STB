// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_shopping_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductShoppingAssignmentImpl _$$ProductShoppingAssignmentImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductShoppingAssignmentImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$ProductShoppingAssignmentImplToJson(
        _$ProductShoppingAssignmentImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
