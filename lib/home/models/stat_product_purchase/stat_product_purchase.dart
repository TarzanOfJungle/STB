import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_product_purchase.freezed.dart';
part 'stat_product_purchase.g.dart';

@freezed
class StatProductPurchase with _$StatProductPurchase {
  const factory StatProductPurchase({
    required int productId,
    required int quantity,
    required double unitPrice,
    required DateTime created,
    required DateTime updated,
  }) = _StatProductPurchase;

  const StatProductPurchase._();

  factory StatProductPurchase.fromJson(Map<String, Object?> json) =>
      _$StatProductPurchaseFromJson(json);

  double get purchasedAmmount => quantity * unitPrice;
}
