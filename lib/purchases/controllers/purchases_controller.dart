import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/put_product_shopping_assignment/put_product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/purchases/extensions/user_purchase_create_update.dart';
import 'package:split_the_bill/purchases/extensions/user_purchase_delete.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

class PurchasesController {
  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _productAssignmentsWithPurchases = BehaviorSubject.seeded(null);
  final BehaviorSubject<AddProductAssignmentState> _addProductAssignmentState =
      BehaviorSubject.seeded(AddProductAssignmentState.empty());
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  Stream<ProductAssignmentsWithPurchases?>
      get productAssignmentsWithPurchasesStream =>
          _productAssignmentsWithPurchases.stream;
  Stream<AddProductAssignmentState> get addProductAssignmentStateStream =>
      _addProductAssignmentState.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  ProductAssignmentsWithPurchases? get productAssignmentsWithPurchases =>
      _productAssignmentsWithPurchases.value;
  AddProductAssignmentState get addProductAssignmentState =>
      _addProductAssignmentState.value;
  bool get isLoading => _isLoading.value;

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  late final ShoppingDetailController _shoppingDetailController;
  late final SnackbarMessangerController _snackbarMessangerController;
  late final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  late final ProductPurchasesRepositoryBase _productPurchasesRepository;

  PurchasesController({
    required ShoppingDetailController shoppingDetailController,
    required SnackbarMessangerController snackbarMessangerController,
    required ProductAssignmentsRepositoryBase productAssignmentsRepository,
    required ProductPurchasesRepositoryBase productPurchasesRepository,
  }) {
    _productAssignmentsRepository = productAssignmentsRepository;
    _snackbarMessangerController = snackbarMessangerController;
    _productPurchasesRepository = productPurchasesRepository;
    _shoppingDetailController = shoppingDetailController;

    _listenForShoppingDetailChanges();
  }

  void _listenForShoppingDetailChanges() {
    _shoppingDetailController.shopping.listen(
      (newShoppingState) {
        if (newShoppingState != null) {
          _productAssignmentsWithPurchases.add(null);
          _addProductAssignmentState.add(AddProductAssignmentState.empty());
          _fetchAssignmentsAndPurchases(newShoppingState.shopping.id);
        }
      },
    );
  }

  Future<void> _fetchAssignmentsAndPurchases(int shoppingId) async {
    if (isLoading) {
      return;
    }
    _productAssignmentsWithPurchases.add(null);
    _isLoading.add(true);
    try {
      final productAssignments = await _productAssignmentsRepository
          .getProductAssignmentsOfShopping(shoppingId);
      final productPurchases = await _productPurchasesRepository
          .getProductPurchasesOfShopping(shoppingId);

      final assignmentsWithPurchases = ProductAssignmentsWithPurchases(
        productAssignments: productAssignments,
        productPurchases: productPurchases,
      );
      _productAssignmentsWithPurchases.add(assignmentsWithPurchases);
    } catch (_) {
      _productAssignmentsWithPurchases.add(
        ProductAssignmentsWithPurchases.empty(),
      );
      _snackbarMessangerController.showSnackbarMessage(
        SnackbarMessage(
          message: "Failed to load shopping items",
          category: SnackbarMessageCategory.ERROR,
        ),
      );
    }
    _isLoading.add(false);
  }

  void setAddProductAssignmentName(String? newName) {
    _addProductAssignmentState
        .add(addProductAssignmentState.copyWith(productName: newName));
  }

  void setAddProductAssignmentQuantity(int? newQuantity) {
    if (newQuantity == null || newQuantity <= 0) {
      _addProductAssignmentState
          .add(addProductAssignmentState.copyWith(quantity: null));
      return;
    }
    _addProductAssignmentState
        .add(addProductAssignmentState.copyWith(quantity: newQuantity));
  }

  Future<bool> createNewProductAssignment() async {
    if (isLoading || _shoppingId == null) {
      return false;
    }
    if (!addProductAssignmentState.canCreateAssignment) {
      return false;
    }
    _isLoading.add(true);
    try {
      final newAssigmnet = PutProductShoppingAssignment(
        shoppingId: _shoppingId!,
        productName: addProductAssignmentState.productName!,
        quantity: addProductAssignmentState.quantity!,
      );
      final addedAssignment = await _productAssignmentsRepository
          .addOrUpdateProductAssignment(newAssigmnet);

      _addNewProductAssignment(addedAssignment);
      _addProductAssignmentState.add(AddProductAssignmentState.empty());
      _isLoading.add(false);
      return true;
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(
        SnackbarMessage(
          message: "Couldn't add shopping item",
          category: SnackbarMessageCategory.ERROR,
        ),
      );
    }
    _isLoading.add(false);
    return false;
  }

  void _addNewProductAssignment(ProductShoppingAssignment assignment) {
    if (productAssignmentsWithPurchases == null) {
      return;
    }
    final newState =
        productAssignmentsWithPurchases!.copyWith(productAssignments: [
      ...productAssignmentsWithPurchases!.productAssignments,
      assignment,
    ]);
    _productAssignmentsWithPurchases.add(newState);
  }

  void addOrUpdateUserPurchase({
    required int productId,
    required UserWithPurchaseContext userPurchase,
  }) {
    final newState = productAssignmentsWithPurchases?.withUserPurchase(
      productId: productId,
      userPurchase: userPurchase,
    );
    if (newState != null) {
      _productAssignmentsWithPurchases.add(newState);
    }
  }

  void deleteUserPurchase({
    required int productId,
    required int userId,
  }) {
    final newState = productAssignmentsWithPurchases?.withDeletedUserPurchase(
      productId: productId,
      userId: userId,
    );
    if (newState != null) {
      _productAssignmentsWithPurchases.add(newState);
    }
  }
}
