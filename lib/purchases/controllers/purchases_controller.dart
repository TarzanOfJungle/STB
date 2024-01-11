import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

class PurchasesController with AuthenticatedSocketObserver {
  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _productAssignmentsWithPurchases = BehaviorSubject.seeded(null);

  final BehaviorSubject<List<UserPurchases>> _usersWithPurchases =
      BehaviorSubject.seeded([]);

  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _filteredProductAssignmentsWithPurchases = BehaviorSubject.seeded(null);

  Stream<ProductAssignmentsWithPurchases?>
      get productAssignmentsWithPurchasesStream =>
          _productAssignmentsWithPurchases.stream;

  Stream<bool> get isLoadingStream => _isLoading.stream;

  Stream<List<UserPurchases>> get usersWithPurchasesStream =>
      _usersWithPurchases.stream;

  ProductAssignmentsWithPurchases? get productAssignmentsWithPurchases =>
      _productAssignmentsWithPurchases.value;

  bool get isLoading => _isLoading.value;

  Stream<ProductAssignmentsWithPurchases?> get filteredAssignmentsStream =>
      _filteredProductAssignmentsWithPurchases.stream;

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
          _isLoading.add(false);
          _productAssignmentsWithPurchases.add(null);
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
    clearFilter();

    final usersWithPurchases = await _productPurchasesRepository
        .getUserPurchasesOfShopping(shoppingId);
    _usersWithPurchases.add(usersWithPurchases);
  }

  void filterAssignments(String? query) {
    if (query == null) {
      clearFilter();
      return;
    }
    var data = _productAssignmentsWithPurchases.value;
    if (data == null) {
      return;
    }
    var filtered = ProductAssignmentsWithPurchases(
      productAssignments: _productAssignmentsWithPurchases
          .value!.productAssignments
          .where((e) => e.product.name.toLowerCase().contains(query.toLowerCase()))
          .toList(),
      productPurchases: data.productPurchases,
    );
    _filteredProductAssignmentsWithPurchases.add(filtered);
  }

  void clearFilter() {
    var data = _productAssignmentsWithPurchases.value;
    _filteredProductAssignmentsWithPurchases.add(data);
  }

  Future<void> deleteProductAssignemnt(String productName) async {
    if (isLoading || shoppingId == null) {
      return;
    }
    _isLoading.add(true);
    try {
      await _productAssignmentsRepository.deleteProductAssignmentFromShopping(
        shoppingId!,
        productName,
      );
      final message = "$productName was removed from this shopping";
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: message,
        category: SnackbarMessageCategory.INFO,
      ));
    } catch (_) {
      final message = "Failed to remove $productName from this shopping";
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: message,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
  }
}
