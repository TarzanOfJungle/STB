import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_changed.freezed.dart';
part 'purchase_changed.g.dart';
@freezed
class PurchaseChanged with _$PurchaseChanged {

  const factory PurchaseChanged({
    required int shoppingId,
    required int productId,
    required int userId,
}) = _PurchaseChanged;

  const PurchaseChanged._();

  factory PurchaseChanged.fromJson(Map<String, Object?> json) =>
      _$PurchaseChangedFromJson(json);
}