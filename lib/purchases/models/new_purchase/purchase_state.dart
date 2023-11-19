import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';

part 'purchase_state.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class PurchaseState with _$PurchaseState {
  const factory PurchaseState({
    required int currentUserId,
    required ProductShoppingAssignment existingAssignment,
    ProductPurchase? existingPurchases,
    int? currentUserPurchaseQuantity,
    double? currentUserPurchaseUnitPrice,
  }) = _PurchaseState;

  UserWithPurchaseContext? get existingPurchaseOfCurrentUser =>
      existingPurchases?.userPurchases
          .where((userPurchase) => userPurchase.user.id == currentUserId)
          .firstOrNull;

  int get quantityToBePurchased => existingAssignment.quantity;

  int get quantityPurchasedByOtherUsers =>
      (existingPurchases?.quantityPurchased ?? 0) -
      (existingPurchaseOfCurrentUser?.quantity ?? 0);
  double get ammountPurchasedByOtherUsers =>
      (existingPurchases?.ammountSpent ?? 0) -
      (existingPurchaseOfCurrentUser?.ammountPurchased ?? 0);


  int get totalPurchasedQuantity {
    return quantityPurchasedByOtherUsers + (currentUserPurchaseQuantity ?? 0);
  }
  double get totalPurchasedAmmount {
    final ammountPurchasedByCurrentUser = (currentUserPurchaseQuantity ?? 0) *
        (currentUserPurchaseUnitPrice ?? 0);
    return ammountPurchasedByOtherUsers + ammountPurchasedByCurrentUser;
  }

  const PurchaseState._();
}
