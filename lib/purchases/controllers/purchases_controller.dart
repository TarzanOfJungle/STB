import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';
import 'package:split_the_bill/purchases/models/put_product_shopping_assignment/put_product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

class PurchasesController {
  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _productAssignmentsWithPurchases = BehaviorSubject.seeded(null);
  final BehaviorSubject<AddProductAssignmentState> _addProductAssignmentState =
      BehaviorSubject.seeded(AddProductAssignmentState.empty());
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  final BehaviorSubject<List<UserPurchases>> _usersWithPurchases =
      BehaviorSubject.seeded([]);

  Stream<ProductAssignmentsWithPurchases?>
      get productAssignmentsWithPurchasesStream =>
          _productAssignmentsWithPurchases.stream;
  Stream<AddProductAssignmentState> get addProductAssignmentStateStream =>
      _addProductAssignmentState.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  Stream<List<UserPurchases>> get usersWithPurchasesStream =>
      _usersWithPurchases.stream;

  ProductAssignmentsWithPurchases? get productAssignmentsWithPurchases =>
      _productAssignmentsWithPurchases.value;
  AddProductAssignmentState get addProductAssignmentState =>
      _addProductAssignmentState.value;
  bool get isLoading => _isLoading.value;

  int? get shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  List<UserPurchases> get usersWithPurchases => _usersWithPurchases.value;

  late final ShoppingDetailController _shoppingDetailController;
  late final SnackbarMessangerController _snackbarMessangerController;
  late final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  late final ProductPurchasesRepositoryBase _productPurchasesRepository;

  PurchasesController(
    this._shoppingDetailController,
    this._snackbarMessangerController,
    this._productAssignmentsRepository,
    this._productPurchasesRepository,
  ) {
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

      final usersWithPurchases = await _productPurchasesRepository
          .getUserPurchasesOfShopping(shoppingId);
      _usersWithPurchases.add(usersWithPurchases);
    } catch (_) {
      _productAssignmentsWithPurchases.add(
        ProductAssignmentsWithPurchases.empty(),
      );
      _usersWithPurchases.add([]);
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
    if (isLoading || shoppingId == null) {
      return false;
    }
    if (!addProductAssignmentState.canCreateAssignment) {
      return false;
    }
    _isLoading.add(true);
    try {
      final newAssigmnet = PutProductShoppingAssignment(
        shoppingId: shoppingId!,
        productName: addProductAssignmentState.productName!,
        quantity: addProductAssignmentState.quantity!,
      );
      await _productAssignmentsRepository
          .addOrUpdateProductAssignment(newAssigmnet);
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
}
