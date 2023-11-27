// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_shopping_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserShoppingAssignmentImpl _$$UserShoppingAssignmentImplFromJson(
        Map<String, dynamic> json) =>
    _$UserShoppingAssignmentImpl(
      shoppingId: json['shoppingId'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserShoppingAssignmentImplToJson(
        _$UserShoppingAssignmentImpl instance) =>
    <String, dynamic>{
      'shoppingId': instance.shoppingId,
      'user': instance.user,
    };
