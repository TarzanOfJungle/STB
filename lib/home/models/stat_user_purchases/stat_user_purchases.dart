import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/home/models/stat_product_purchase/stat_product_purchase.dart';

part 'stat_user_purchases.freezed.dart';
part 'stat_user_purchases.g.dart';

@freezed
class StatUserPurchases with _$StatUserPurchases {
  const factory StatUserPurchases({
    required int userId,
    required List<StatProductPurchase> productPurchases,
  }) = _StatUserPurchases;

  const StatUserPurchases._();

  factory StatUserPurchases.fromJson(Map<String, Object?> json) =>
      _$StatUserPurchasesFromJson(json);

  double get totalAmmountSpentByUser => productPurchases.fold(
      0,
      (previousValue, productPurchase) =>
          previousValue + productPurchase.purchasedAmmount);
}
