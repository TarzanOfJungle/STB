import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int payingUserId,
    required int payedUserId,
    required double ammount,
  }) = _Transaction;

  const Transaction._();

  factory Transaction.fromJson(Map<String, Object?> json)
  => _$TransactionFromJson(json);
}