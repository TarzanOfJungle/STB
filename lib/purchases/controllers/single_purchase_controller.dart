import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/put_product_purchase/put_product_purchase.dart';
import 'package:split_the_bill/purchases/models/put_product_shopping_assignment/put_product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';

const _COULDNT_SAVE_CHANGES_MESSAGE = "Saving purchase failed.";
const _COULDNT_CANCEL_MESSAGE = "Cancelling purchase failed.";

const _TOTAL_QUANTITY_UPDATED = "Total quantity to be purchased updated";
const _TOTAL_QUANTITY_UPDATE_FAILED_MESSAGE =
    "Updating total quantity to be purchased failed.";

class SinglePurchaseController with AuthenticatedSocketObserver {
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
  int? get _currentShoppingId => _purchaseState.value?.currentShoppingId;

  final AuthController _authController;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;
  final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  SinglePurchaseController(
    this._authController,
    this._productPurchasesRepository,
    this._productAssignmentsRepository,
    this._snackbarMessangerController,
  ) {
    _listenForProductAssignmentChanges();
  }

  void _listenForProductAssignmentChanges() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream:
          _productAssignmentsRepository.getProductAssignmentChangesStream,
      onValueChanged: (newValue) {
        final updatedAssignment = newValue.data;
        if (purchaseState != null &&
            updatedAssignment.shoppingId == _currentShoppingId) {
          setPurchase(
            shoppingId: _currentShoppingId!,
            existingAssignment: updatedAssignment,
            existingPurchases: purchaseState!.existingPurchases,
          );
        }
      },
    );
  }

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
          editedUnitPrice: existingPurchaseByUser.unitPrice,
          editedQuantity: existingPurchaseByUser.quantity,
        );
      }
    }
    _purchaseState.add(newState);
  }

  void editedQuantityChanged(int? newQuantity) {
    final currentState = _purchaseState.value;
    if (currentState == null) {
      return;
    }
    if (newQuantity == null || newQuantity <= 0) {
      _purchaseState.add(currentState.copyWith(editedQuantity: null));
      return;
    }
    final newQuantityHigherThanAllowed =
        (currentState.quantityPurchasedByOtherUsers + newQuantity) >
            currentState.totalQuantityToBePurchased;

    if (newQuantityHigherThanAllowed) {
      final maxQuantity = currentState.totalQuantityToBePurchased -
          currentState.quantityPurchasedByOtherUsers;
      _purchaseState.add(
        currentState.copyWith(editedQuantity: maxQuantity),
      );
      return;
    }
    _purchaseState.add(
      currentState.copyWith(editedQuantity: newQuantity),
    );
  }

  void editedUnitPriceChanged(double? newUnitPrice) {
    final currentState = _purchaseState.value;
    if (currentState == null) {
      return;
    }
    if (newUnitPrice == null || newUnitPrice <= 0) {
      _purchaseState.add(currentState.copyWith(
        editedUnitPrice: null,
      ));
      return;
    }
    final newState = currentState.copyWith(editedUnitPrice: newUnitPrice);
    _purchaseState.add(newState);
  }

  Future<bool> saveChanges() async {
    if (isLoading || _currentShoppingId == null) {
      return false;
    }
    if (!dataValidForSaving()) {
      return false;
    }
    final isUpdate = purchaseState?.existingPurchaseOfCurrentUser != null;
    _isLoading.add(true);
    try {
      final productId = purchaseState!.existingAssignment.product.id;
      final quantity = purchaseState!.editedQuantity!;
      final unitPrice = purchaseState!.editedUnitPrice!;

      final putRequest = PutProductPurchase(
        shoppingId: _currentShoppingId!,
        productId: productId,
        quantity: quantity,
        unitPrice: unitPrice,
      );
      await _productPurchasesRepository.addOrUpdateProductPurchase(putRequest);

      _isLoading.add(false);
      final message = isUpdate ? "Purchase updated" : "Purchase created";
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: message,
        category: SnackbarMessageCategory.SUCCESS,
      ));

      return true;
    } catch (_) {}

    _showMessage(_COULDNT_SAVE_CHANGES_MESSAGE, SnackbarMessageCategory.ERROR);
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

    _showMessage(_COULDNT_CANCEL_MESSAGE, SnackbarMessageCategory.ERROR);
    _isLoading.add(false);
    return false;
  }

  bool dataValidForSaving() {
    if (purchaseState == null ||
        purchaseState!.editedQuantity == null ||
        purchaseState!.editedUnitPrice == null) {
      return false;
    }
    final quantitySum = purchaseState!.quantityPurchasedByOtherUsers +
        purchaseState!.editedQuantity!;
    final quantityValid =
        quantitySum <= purchaseState!.totalQuantityToBePurchased;

    return quantityValid;
  }

  void _showMessage(String message, SnackbarMessageCategory category) {
    final snackbarMessage = SnackbarMessage(
      message: message,
      category: category,
    );
    _snackbarMessangerController.showSnackbarMessage(snackbarMessage);
  }

  UserWithPurchaseContext? getCurrentUserPuchaseToDisplay() {
    final state = _purchaseState.value;
    if (state == null) {
      return null;
    }

    final userInputEmpty =
        state.editedQuantity == null && state.editedUnitPrice == null;
    if (userInputEmpty && state.existingPurchaseOfCurrentUser == null) {
      return null;
    }
    if (state.existingPurchaseOfCurrentUser != null && userInputEmpty) {
      return state.existingPurchaseOfCurrentUser;
    }
    final userQuantity = state.editedQuantity;
    final userUnitPrice = state.editedUnitPrice;

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

  Future<bool> changeProductAssignmentQuantity(int newQuantity) async {
    if (isLoading || _currentShoppingId == null || purchaseState == null) {
      return false;
    }
    _isLoading.add(true);
    try {
      final request = PutProductShoppingAssignment(
        shoppingId: _currentShoppingId!,
        productName: purchaseState!.existingAssignment.product.name,
        quantity: newQuantity,
      );
      await _productAssignmentsRepository.addOrUpdateProductAssignment(request);
      _isLoading.add(false);
      _showMessage(_TOTAL_QUANTITY_UPDATED, SnackbarMessageCategory.SUCCESS);
      return true;
    } catch (_) {}

    _showMessage(
        _TOTAL_QUANTITY_UPDATE_FAILED_MESSAGE, SnackbarMessageCategory.ERROR);
    _isLoading.add(false);
    return false;
  }
}
