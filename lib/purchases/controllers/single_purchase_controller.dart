import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';

class SinglePurchaseController {
  final BehaviorSubject<PurchaseState?> _purchaseState =
      BehaviorSubject.seeded(null);

  Stream<PurchaseState?> get purchaseStateStream => _purchaseState.stream;

  late final AuthController _authController;
  late final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  late final ProductPurchasesRepositoryBase _productPurchasesRepository;

  SinglePurchaseController({
    required AuthController authController,
    required ProductAssignmentsRepositoryBase productAssignmentsRepository,
    required ProductPurchasesRepositoryBase productPurchasesRepository,
  }) {
    _authController = authController;
    _productAssignmentsRepository = productAssignmentsRepository;
    _productPurchasesRepository = productPurchasesRepository;
  }

  /// If current user already purchased some of the given product,
  /// method adds his purchase into initial state.
  void setPurchase({
    required ProductShoppingAssignment existingAssignment,
    ProductPurchase? existingPurchases,
  }) {
    final currentUser = _authController.loggedInUser!;
    var newState = PurchaseState(
      existingAssignment: existingAssignment,
      existingPurchases: existingPurchases,
      currentUserId: currentUser.id,
    );
    if (newState.existingPurchases != null) {
      final existingPurchaseByUser = newState.existingPurchaseOfCurrentUser;
      if (existingPurchaseByUser != null) {
        newState = newState.copyWith(
          currentUserPurchaseUnitPrice: existingPurchaseByUser.unitPrice,
          currentUserPurchaseQuantity: existingPurchaseByUser.quantity,
        );
      }
    }
    _purchaseState.add(newState);
  }

  void additionalQuantityChanged(int? newQuantity) {
    final currentState = _purchaseState.value;
    if (currentState == null) {
      return;
    }
    if (newQuantity == null) {
      _purchaseState
          .add(currentState.copyWith(currentUserPurchaseQuantity: null));
      return;
    }
    final newQuantityHigherThanAllowed =
        (currentState.quantityPurchasedByOtherUsers + newQuantity) >
            currentState.quantityToBePurchased;
    if (newQuantity < 0 || newQuantityHigherThanAllowed) {
      _purchaseState.add(currentState);
      return;
    }
    final newState =
        currentState.copyWith(currentUserPurchaseQuantity: newQuantity);
    _purchaseState.add(newState);
  }

  void additionalUnitPriceChanged(double? newUnitPrice) {
    final currentState = _purchaseState.value;
    if (currentState == null) {
      return;
    }
    if (newUnitPrice == null) {
      _purchaseState.add(currentState.copyWith(
        currentUserPurchaseUnitPrice: null,
      ));
      return;
    }
    if (newUnitPrice <= 0) {
      _purchaseState.add(currentState);
    }
    final newState =
        currentState.copyWith(currentUserPurchaseUnitPrice: newUnitPrice);
    _purchaseState.add(newState);
  }

  T? getAdditionalValueFromString<T extends num>(
    String value,
    T? Function(String) parseFunction,
  ) {
    final parsed = parseFunction(value);
    if (parsed == 0) {
      return null;
    }
    return parsed;
  }

  // Future<void> fetchAssignmentsAndPurchases(int shoppingId) async {
  //   _productAssignmentsWithPurchases.add(null);
  //   try {
  //     final productAssignments = await _productAssignmentsRepository
  //         .getProductAssignmentsOfShopping(shoppingId);
  //     final productPurchases = await _productPurchasesRepository
  //         .getProductPurchasesOfShopping(shoppingId);

  //     final assignmentsWithPurchases = ProductAssignmentsWithPurchases(
  //       productAssignments: productAssignments,
  //       productPurchases: productPurchases,
  //     );
  //     _productAssignmentsWithPurchases.add(assignmentsWithPurchases);
  //   } catch (_) {
  //     _productAssignmentsWithPurchases.add(
  //       ProductAssignmentsWithPurchases.empty(),
  //     );
  //   }
  // }
}
