import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';

extension UserPurchaseDelete on ProductAssignmentsWithPurchases {
  /// Method attempts to return new version of state that doesn't contain
  /// the [UserWithPurchaseContext] specified by [productId] and [userId]
  ProductAssignmentsWithPurchases? withDeletedUserPurchase({
    required int productId,
    required int userId,
  }) {
    final existingProductAssignment = productAssignments
        .where((assignment) => assignment.product.id == productId)
        .firstOrNull;
    if (existingProductAssignment == null) {
      return null;
    }
    final existingPurchase =
        getProductPurchaseOfAssignment(existingProductAssignment);
    if (existingPurchase == null) {
      return null;
    }
    final userPurchaseToDelete = existingPurchase.userPurchases
        .where((userPurchase) => userPurchase.user.id == userId)
        .firstOrNull;
    if (userPurchaseToDelete == null) {
      return null;
    }
    final newUserPurchasesList = [...existingPurchase.userPurchases];
    newUserPurchasesList
        .removeWhere((userPurchase) => userPurchase.user.id == userId);

    final newPurchasesList = [...productPurchases];
    newPurchasesList.removeWhere(
        (productPurchase) => productPurchase.product.id == productId);

    newPurchasesList
        .add(existingPurchase.copyWith(userPurchases: newUserPurchasesList));

    final newState = copyWith(productPurchases: newPurchasesList);

    return newState;
  }
}
