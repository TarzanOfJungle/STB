import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/home/models/stat_user_purchases/stat_user_purchases.dart';

part 'stat_shopping_purchases.freezed.dart';
part 'stat_shopping_purchases.g.dart';

@freezed
class StatShoppingPurchases with _$StatShoppingPurchases {
  const factory StatShoppingPurchases({
    required int shoppingId,
    required List<StatUserPurchases> userPurchases,
  }) = _StatShoppingPurchases;

  const StatShoppingPurchases._();

  factory StatShoppingPurchases.fromJson(Map<String, Object?> json) =>
      _$StatShoppingPurchasesFromJson(json);

  double get totalAmmountSpentOnShopping => userPurchases.fold(
      0,
      (previousValue, userPurchase) =>
          previousValue + userPurchase.totalAmmountSpentByUser);
}
