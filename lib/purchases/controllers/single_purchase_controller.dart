import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/put_product_purchase/put_product_purchase.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';

const _COULDNT_SAVE_CHANGES_MESSAGE = "Saving purchase failed.";
const _COULDNT_CANCEL_MESSAGE = "Cancelling purchase failed.";

class SinglePurchaseController {
  final BehaviorSubject<PurchaseState?> _purchaseState =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  final StreamController<String?> _errorMessageController =
      StreamController.broadcast();

  Stream<PurchaseState?> get purchaseStateStream => _purchaseState.stream;
  PurchaseState? get purchaseState => _purchaseState.value;

  Stream<bool> get isLoadingStream => _isLoading.stream;
  bool get isLoading => _isLoading.value;

  Stream<String?> get errorMessageStream => _errorMessageController.stream;
  bool get isUsersFirstPurchase =>
      purchaseState?.existingPurchaseOfCurrentUser == null;

  // TODO: this value will be fetched from the shopping detail controller, once it is implemented
  int get _currentShoppingId => 1;
  AuthenticatedUser get _currentUser => _authController.loggedInUser!;

  late final AuthController _authController;
  late final PurchasesController _purchasesController;
  late final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  late final ProductPurchasesRepositoryBase _productPurchasesRepository;

  SinglePurchaseController({
    required AuthController authController,
    required PurchasesController purchasesController,
    required ProductAssignmentsRepositoryBase productAssignmentsRepository,
    required ProductPurchasesRepositoryBase productPurchasesRepository,
  }) {
    _authController = authController;
    _purchasesController = purchasesController;
    _productAssignmentsRepository = productAssignmentsRepository;
    _productPurchasesRepository = productPurchasesRepository;
  }

  /// If current user already purchased some of the given product,
  /// method adds his purchase into initial state.
  void setPurchase({
    required ProductShoppingAssignment existingAssignment,
    ProductPurchase? existingPurchases,
  }) {
    var newState = PurchaseState(
      existingAssignment: existingAssignment,
      existingPurchases: existingPurchases,
      currentUserId: _currentUser.id,
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

  Future<bool> saveChanges() async {
    if (isLoading) {
      return false;
    }
    if (!dataValidForSaving()) {
      return false;
    }
    _isLoading.add(true);
    try {
      final productId = purchaseState!.existingAssignment.product.id;
      final quantity = purchaseState!.currentUserPurchaseQuantity!;
      final unitPrice = purchaseState!.currentUserPurchaseUnitPrice!;

      final putRequest = PutProductPurchase(
        shoppingId: _currentShoppingId,
        productId: productId,
        quantity: quantity,
        unitPrice: unitPrice,
      );
      await _productPurchasesRepository.addOrUpdateProductPurchase(putRequest);

      _purchasesController.addOrUpdateUserPurchase(
        productId: purchaseState!.existingAssignment.product.id,
        userPurchase: UserWithPurchaseContext(
          user: _authController.loggedInUser!.asUser(),
          quantity: quantity,
          unitPrice: unitPrice,
        ),
      );

      _errorMessageController.add(null);
      _isLoading.add(false);
      return true;
    } catch (_) {}

    _errorMessageController.add(_COULDNT_SAVE_CHANGES_MESSAGE);
    _isLoading.add(false);
    return false;
  }

  Future<bool> deleteExistingPurchase() async {
    if(isLoading){
      return false;
    }
    if (isUsersFirstPurchase) {
      return false;
    }
    _isLoading.add(true);
    try {
      await _productPurchasesRepository.deleteProductPurchase(
        _currentShoppingId,
        purchaseState!.existingAssignment.product.id,
      );
      _purchasesController.deleteUserPurchase(
        productId: purchaseState!.existingAssignment.product.id,
        userId: _currentUser.id,
      );

      _errorMessageController.add(null);
      _isLoading.add(false);
      return true;
    } catch (_) {}

    _errorMessageController.add(_COULDNT_CANCEL_MESSAGE);
    _isLoading.add(false);
    return false;
  }

  bool dataValidForSaving() {
    if (purchaseState == null ||
        purchaseState!.currentUserPurchaseQuantity == null ||
        purchaseState!.currentUserPurchaseUnitPrice == null) {
      return false;
    }
    final quantitySum = purchaseState!.quantityPurchasedByOtherUsers +
        purchaseState!.currentUserPurchaseQuantity!;
    final quantityValid = quantitySum <= purchaseState!.quantityToBePurchased;

    return quantityValid;
  }
}
