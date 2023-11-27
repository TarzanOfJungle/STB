import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';
import 'package:split_the_bill/purchases/models/put_product_shopping_assignment/put_product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

class PurchasesController with AuthenticatedSocketObserver {
  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _productAssignmentsWithPurchases = BehaviorSubject.seeded(null);

  final BehaviorSubject<AddProductAssignmentState> _addProductAssignmentState =
      BehaviorSubject.seeded(AddProductAssignmentState.empty());

  final BehaviorSubject<List<UserPurchases>> _usersWithPurchases =
      BehaviorSubject.seeded([]);

  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

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

  final ShoppingDetailController _shoppingDetailController;
  final SnackbarMessangerController _snackbarMessangerController;
  final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;

  PurchasesController(
    this._shoppingDetailController,
    this._snackbarMessangerController,
    this._productAssignmentsRepository,
    this._productPurchasesRepository,
  ) {
    _listenForShoppingDetailChanges();
    _listenForPurchaseAndAssignmentChanges();
  }

  void _listenForShoppingDetailChanges() {
    _shoppingDetailController.shopping.listen(
      (newShoppingState) {
        if (newShoppingState != null) {
          _productAssignmentsWithPurchases.add(null);
          _addProductAssignmentState.add(AddProductAssignmentState.empty());
          _loadData(newShoppingState.shopping.id);
        }
      },
    );
  }

  void _listenForPurchaseAndAssignmentChanges() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream: _productPurchasesRepository.getPurchaseChangesStream,
      onValueChanged: (newValue) {
        if (newValue.data.shoppingId == shoppingId) {
          _refreshData(shoppingId!);
        }
      },
    );
    observeSocketEvents(
      eventStream:
          _productAssignmentsRepository.getProductAssignmentChangesStream,
      onValueChanged: (newValue) {
        if (newValue.data.shoppingId == shoppingId) {
          _refreshData(shoppingId!);
        }
      },
    );
  }

  Future<void> _loadData(int shoppingId) async {
    if (isLoading) {
      return;
    }
    _productAssignmentsWithPurchases.add(null);
    _isLoading.add(true);
    try {
      _fetchAssignmentsAndPurchases(shoppingId);
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

  Future<void> _refreshData(int shoppingId) async {
    try {
      _fetchAssignmentsAndPurchases(shoppingId);
    } catch (_) {}
  }

  Future<void> _fetchAssignmentsAndPurchases(int shoppingId) async {
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
