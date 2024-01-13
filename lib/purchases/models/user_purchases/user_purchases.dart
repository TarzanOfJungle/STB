import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../users/models/user/user.dart';
import '../product_with_purchase_context/product_with_purchase_context.dart';

part 'user_purchases.freezed.dart';
part 'user_purchases.g.dart';

@freezed
class UserPurchases with _$UserPurchases {
  const factory UserPurchases({
    required User user,
    required List<ProductWithPurchaseContext> productPurchases,
  }) = _UserPurchases;
  const UserPurchases._();

  factory UserPurchases.fromJson(Map<String, Object?> json) =>
      _$UserPurchasesFromJson(json);

  double get totalAmmount => productPurchases.fold(
      0.0, (previousValue, p) => previousValue + p.totalAmountSpent);
}
