// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      payingUserId: json['payingUserId'] as int,
      payedUserId: json['payedUserId'] as int,
      ammount: (json['ammount'] as num).toDouble(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'payingUserId': instance.payingUserId,
      'payedUserId': instance.payedUserId,
      'ammount': instance.ammount,
    };
