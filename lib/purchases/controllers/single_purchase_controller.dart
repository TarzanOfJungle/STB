import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/put_product_purchase/put_product_purchase.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';

const _COULDNT_SAVE_CHANGES_MESSAGE = "Saving purchase failed.";
const _COULDNT_CANCEL_MESSAGE = "Cancelling purchase failed.";

class SinglePurchaseController {
  final BehaviorSubject<PurchaseState?> _purchaseState =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  Stream<PurchaseState?> get purchaseStateStream => _purchaseState.stream;
  PurchaseState? get purchaseState => _purchaseState.value;

  Stream<bool> get isLoadingStream => _isLoading.stream;
  bool get isLoading => _isLoading.value;

  bool get isUsersFirstPurchase =>
      purchaseState?.existingPurchaseOfCurrentUser == null;

  AuthenticatedUser get _currentUser => _authController.loggedInUser!;
  int? get _currentShoppingId => _purchaseState.value?.currentUserId;

  final AuthController _authController;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  SinglePurchaseController(
    this._authController,
    this._productPurchasesRepository,
    this._snackbarMessangerController,
  );

  

  /// If current user already purchased some of the given product,
  /// method adds his purchase into initial state.
  void setPurchase({
    required int shoppingId,
    required ProductShoppingAssignment existingAssignment,
    ProductPurchase? existingPurchases,
  }) {
    var newState = PurchaseState(
      currentShoppingId: shoppingId,
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
    if (newQuantity == null || newQuantity <= 0) {
      _purchaseState
          .add(currentState.copyWith(currentUserPurchaseQuantity: null));
      return;
    }
    final newQuantityHigherThanAllowed =
        (currentState.quantityPurchasedByOtherUsers + newQuantity) >
            currentState.quantityToBePurchased;

    if (newQuantityHigherThanAllowed) {
      final maxQuantity = currentState.quantityToBePurchased -
          currentState.quantityPurchasedByOtherUsers;
      _purchaseState.add(
        currentState.copyWith(currentUserPurchaseQuantity: maxQuantity),
      );
      return;
    }
    _purchaseState.add(
      currentState.copyWith(currentUserPurchaseQuantity: newQuantity),
    );
  }

  void additionalUnitPriceChanged(double? newUnitPrice) {
    final currentState = _purchaseState.value;
    if (currentState == null) {
      return;
    }
    if (newUnitPrice == null || newUnitPrice <= 0) {
      _purchaseState.add(currentState.copyWith(
        currentUserPurchaseUnitPrice: null,
      ));
      return;
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
    if (isLoading || _currentShoppingId == null) {
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
        shoppingId: _currentShoppingId!,
        productId: productId,
        quantity: quantity,
        unitPrice: unitPrice,
      );
      await _productPurchasesRepository.addOrUpdateProductPurchase(putRequest);

      _isLoading.add(false);
      return true;
    } catch (_) {}

    _showError(_COULDNT_SAVE_CHANGES_MESSAGE);
    _isLoading.add(false);
    return false;
  }

  Future<bool> deleteExistingPurchase() async {
    if (isLoading || _currentShoppingId == null) {
      return false;
    }
    if (isUsersFirstPurchase) {
      return false;
    }
    _isLoading.add(true);
    try {
      await _productPurchasesRepository.deleteProductPurchase(
        _currentShoppingId!,
        purchaseState!.existingAssignment.product.id,
      );
      _isLoading.add(false);
      return true;
    } catch (_) {}

    _showError(_COULDNT_CANCEL_MESSAGE);
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

  void _showError(String message) {
    final snackbarMessage = SnackbarMessage(
      message: message,
      category: SnackbarMessageCategory.ERROR,
    );
    _snackbarMessangerController.showSnackbarMessage(snackbarMessage);
  }

  UserWithPurchaseContext? getCurrentUserPuchaseToDisplay() {
    final state = _purchaseState.value;
    if (state == null) {
      return null;
    }

    final userInputEmpty = state.currentUserPurchaseQuantity == null &&
        state.currentUserPurchaseUnitPrice == null;
    if (userInputEmpty && state.existingPurchaseOfCurrentUser == null) {
      return null;
    }
    if (state.existingPurchaseOfCurrentUser != null && userInputEmpty) {
      return state.existingPurchaseOfCurrentUser;
    }
    final userQuantity = state.currentUserPurchaseQuantity;
    final userUnitPrice = state.currentUserPurchaseUnitPrice;

    final currentUserQuantityToDisplay =
        userQuantity ?? state.existingPurchaseOfCurrentUser?.quantity ?? 0;
    final currentUserUnitPriceToDisplay =
        userUnitPrice ?? state.existingPurchaseOfCurrentUser?.unitPrice ?? 0;

    return UserWithPurchaseContext(
      user: _authController.loggedInUser!.asUser(),
      quantity: currentUserQuantityToDisplay,
      unitPrice: currentUserUnitPriceToDisplay,
    );
  }
}
