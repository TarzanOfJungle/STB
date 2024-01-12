import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

const String _FETCH_TRANSACTIONS_ERROR_MESSAGE =
    'Unable to update transactions';
const String _FAILED_TO_LOAD_SHOPPING_MESSAGE =
    "Failed to load shopping detail";

class ShoppingDetailController with AuthenticatedSocketObserver {
  final BehaviorSubject<ShoppingWithContext?> _shopping =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<List<Transaction>> _transactions =
      BehaviorSubject.seeded([]);



  final ShoppingsListRepositoryBase shoppingListRepository;
  final TrasactionsRepositoryBase _transactionsRepository;
  final SnackbarMessangerController _snackbarController;
  final ShoppingsListRepositoryBase _shoppingsListRepository;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;
  final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  final UsersRepositoryBase _usersRepository;



  Stream<ShoppingWithContext?> get shopping => _shopping.stream;

  Stream<List<Transaction>> get transactionsStream => _transactions.stream;

  ShoppingWithContext? get currentShoppingState => _shopping.value;

  List<Transaction> get transactions => _transactions.value;

  ShoppingDetailController(
    this.shoppingListRepository,
    this._transactionsRepository,
    this._snackbarController,
    this._shoppingsListRepository,
    this._usersRepository,
    this._productPurchasesRepository,
    this._productAssignmentsRepository,
  ) {
    _listenForShoppingListChanges();
    _listenForUsersChanges();
    _listenForPurchaseAndAssignmentChanges();
  }

  int? get _shoppingId => currentShoppingState?.shopping.id;

  void _listenForShoppingListChanges() {
    observeSocketEvents(
      eventStream: _shoppingsListRepository.getShoppingChangesStream,
      onValueChanged: (assignmentEvent) {
        if (_shoppingId != null &&
            assignmentEvent.data.shopping.id == _shoppingId) {
          putShopping(_shoppingId!);
        }
      },
    );
  }

  void _listenForUsersChanges() {
    observeSocketEvents(
      eventStream: _usersRepository.getUserShoppingAssignmentChangesStream,
      onValueChanged: (assignmentEvent) {
        if (_shoppingId != null &&
            assignmentEvent.data.shoppingId == _shoppingId) {
          putShopping(_shoppingId!);
        }
      },
    );
  }

  void _listenForPurchaseAndAssignmentChanges() {
    observeSocketEvents(
      eventStream: _productPurchasesRepository.getPurchaseChangesStream,
      onValueChanged: (assignmentEvent) {
        if (_shoppingId != null &&
            assignmentEvent.data.shoppingId == _shoppingId) {
          putShopping(_shoppingId!);
        }
      },
    );
    observeSocketEvents(
      eventStream:
          _productAssignmentsRepository.getProductAssignmentChangesStream,
      onValueChanged: (assignmentEvent) {
        if (currentShoppingState != null &&
            _shoppingId != null &&
            assignmentEvent.data.shoppingId == _shoppingId) {
          putShopping(_shoppingId!);
        }
      },
    );
  }

  Future<bool> putShopping(int shoppingId) async {
    try {
      var foundShopping =
          await _shoppingsListRepository.shoppingById(shoppingId: shoppingId);
      _shopping.add(foundShopping);
      return true;
    } catch (_) {
      _showError(_FAILED_TO_LOAD_SHOPPING_MESSAGE);
      _shopping.add(null);
      return false;
    }
  }

  Future<ShoppingWithContext?> shoppingById({required int shoppingId}) async {
    try {} catch (_) {}
    return null;
  }

  Future<bool> fetchTransactions() async {
    var wasSuccess = false;
    try {
      final transactions =
          await _transactionsRepository.getTransactionsOfShopping(
              shoppingId: currentShoppingState!.shopping.id);
      _transactions.add(transactions);
      wasSuccess = true;
    } catch (_) {
      _transactions.add([]);
      _showError(_FETCH_TRANSACTIONS_ERROR_MESSAGE);
    }
    return wasSuccess;
  }

  void _showError(String errorMessage) {
    final message = SnackbarMessage(
      message: errorMessage,
      category: SnackbarMessageCategory.ERROR,
    );
    _snackbarController.showSnackbarMessage(message);
  }
}
