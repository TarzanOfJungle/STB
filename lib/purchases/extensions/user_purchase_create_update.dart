import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';

extension UserPurchaseCreateUpdate on ProductAssignmentsWithPurchases {
  /// Method attempts to return modified state, in which specified [userPurchase]
  /// is either created or updated for [ProductPurchase] with the specified [productId]
  /// (updated in case the given [ProductPurchase] already contains purchase
  /// for the given user).
  ProductAssignmentsWithPurchases? withUserPurchase({
    required int productId,
    required UserWithPurchaseContext userPurchase,
  }) {
    final existingProductAssignment = productAssignments
        .where((assignment) => assignment.product.id == productId)
        .firstOrNull;
    if (existingProductAssignment == null) {
      return null;
    }

    // First ensuring that new state has the proper product purchase
    var newState = copyWith();
    newState = _getOrAddProductPurchase(
      state: newState,
      assignment: existingProductAssignment,
    );
    final purchaseToUpdate =
        newState.getProductPurchaseOfAssignment(existingProductAssignment)!;

    // Then updating the given product purchase with the new user purchase
    var updatedPurchase = _insertUserPurchase(
      userPurchaseToInsert: userPurchase,
      purchaseToInsertInto: purchaseToUpdate,
    );
    final newProductPurchasesList = [...newState.productPurchases];
    newProductPurchasesList.removeWhere((productPurchase) =>
        productPurchase.product.id == updatedPurchase.product.id);

    newProductPurchasesList.add(updatedPurchase);

    // Finally updating the state
    newState = newState.copyWith(productPurchases: newProductPurchasesList);
    return newState;
  }

  /// Method makes sure, that the state contains a [ProductPurchase]
  /// record for the given [ProductShoppingAssignment]. If one
  /// doesn't exist, it is created.
  /// * returns a state, that is guaranteed to have necessary [ProductPurchase]
  ProductAssignmentsWithPurchases _getOrAddProductPurchase({
    required ProductAssignmentsWithPurchases state,
    required ProductShoppingAssignment assignment,
  }) {
    var existingPurchase = state.getProductPurchaseOfAssignment(assignment);
    if (existingPurchase != null) {
      return state;
    }
    final newPurchase = ProductPurchase(
      product: assignment.product.copyWith(),
      totalQuantityToBePurchased: assignment.quantity,
      userPurchases: [],
    );
    return state.copyWith(
      productPurchases: [...state.productPurchases, newPurchase],
    );
  }

  /// Method makes sure, that provided [UserWithPurchaseContext]
  /// is created or updated (if already exists) in the given [ProductPurchase]
  /// * returns [ProductPurchase], that is guaranteed to have provided [UserWithPurchaseContext]
  ProductPurchase _insertUserPurchase({
    required ProductPurchase purchaseToInsertInto,
    required UserWithPurchaseContext userPurchaseToInsert,
  }) {
    final newList = [...purchaseToInsertInto.userPurchases];
    newList.removeWhere(
        (userPurchase) => userPurchase.user.id == userPurchaseToInsert.user.id);

    newList.add(userPurchaseToInsert);
    return purchaseToInsertInto.copyWith(userPurchases: newList);
  }
}
