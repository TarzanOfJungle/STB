import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/products/models/product/product.dart';
import 'package:split_the_bill/products/repositories/products_repository_base.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';
import 'package:split_the_bill/purchases/models/post_product_shopping_assignment/post_product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

const _SEARCH_QUERY_DEBOUNCE_MILLIS = 500;

class AddProductAssignmentController {
  final BehaviorSubject<AddProductAssignmentState> _addProductAssignmentState =
      BehaviorSubject.seeded(AddProductAssignmentState.empty());

  final BehaviorSubject<List<Product>> _productLookup =
      BehaviorSubject.seeded([]);

  final StreamController<String?> _productNameSearchQuery =
      StreamController.broadcast();

  Stream<AddProductAssignmentState> get addProductAssignmentStateStream =>
      _addProductAssignmentState.stream;

  AddProductAssignmentState get addProductAssignmentState =>
      _addProductAssignmentState.value;

  Stream<List<Product>> get productLookup => Rx.combineLatest2(
      _productLookup.stream,
      _purchasesController.productAssignmentsWithPurchasesStream,
      (lookup, existingAssignments) =>
          _filterProductLookup(lookup, existingAssignments));

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  final ShoppingDetailController _shoppingDetailController;
  final PurchasesController _purchasesController;
  final SnackbarMessangerController _snackbarMessangerController;
  final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  final ProductsRepositoryBase _productsRepository;

  AddProductAssignmentController(
    this._shoppingDetailController,
    this._purchasesController,
    this._snackbarMessangerController,
    this._productAssignmentsRepository,
    this._productsRepository,
  ) {
    _listenForProductSearchQuery();
  }

  void _listenForProductSearchQuery() {
    _productNameSearchQuery.stream
        .debounceTime(
            const Duration(milliseconds: _SEARCH_QUERY_DEBOUNCE_MILLIS))
        .listen((query) async {
      if (query == null) {
        return;
      }
      final result = await _productsRepository.getProducts(name: query);
      _productLookup.add(result);
    });
  }

  void resetState() {
    _addProductAssignmentState.add(AddProductAssignmentState.empty());
    _productNameSearchQuery.add(null);
    _productLookup.add([]);
  }

  void setProductAssignmentName(String? newName) {
    _addProductAssignmentState
        .add(addProductAssignmentState.copyWith(productName: newName));
  }

  void setProductSearchQuery(String? searchQuery) {
    if (searchQuery == null || searchQuery.isEmpty) {
      _productNameSearchQuery.add(null);
      _productLookup.add([]);
      return;
    }
    _productNameSearchQuery.add(searchQuery);
  }

  void setProductAssignmentQuantity(int? newQuantity) {
    if (newQuantity == null || newQuantity <= 0) {
      _addProductAssignmentState
          .add(addProductAssignmentState.copyWith(quantity: null));
      return;
    }
    _addProductAssignmentState
        .add(addProductAssignmentState.copyWith(quantity: newQuantity));
  }

  Future<bool> createNewProductAssignment() async {
    if (_shoppingId == null) {
      return false;
    }
    if (!addProductAssignmentState.canCreateAssignment) {
      return false;
    }
    try {
      final newAssigmnet = PostProductShoppingAssignment(
        shoppingId: _shoppingId!,
        productName: addProductAssignmentState.productName!,
        quantity: addProductAssignmentState.quantity!,
      );
      await _productAssignmentsRepository
          .addProductShoppingAssignment(newAssigmnet);
      _addProductAssignmentState.add(AddProductAssignmentState.empty());
      return true;
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(
        SnackbarMessage(
          message: "Couldn't add shopping item",
          category: SnackbarMessageCategory.ERROR,
        ),
      );
      return false;
    }
  }

  List<Product> _filterProductLookup(
    List<Product> fullLookup,
    ProductAssignmentsWithPurchases? existingAssignments,
  ) {
    if (existingAssignments == null) {
      return fullLookup;
    }
    return fullLookup
        .where((product) => existingAssignments.productAssignments
            .where((assignment) => assignment.product.id == product.id)
            .isEmpty)
        .toList();
  }
}
