import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository.dart';

import '../../common/controllers/snackbar_messanger_controller.dart';
import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';
import '../../shoppings_list/repositories/shoppings_list_repository_base.dart';

const String _FETCH_TRANSACTIONS_ERROR_MESSAGE =
    'Unable to update transactions';

class ShoppingDetailController with AuthenticatedSocketObserver {
  final BehaviorSubject<ShoppingWithContext?> _shopping =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<List<Transaction>> _transactions =
      BehaviorSubject.seeded([]);

  late final ShoppingsListController _shoppingListController;
  late final TrasactionsRepositoryBase _transactionsRepository;
  late final SnackbarMessangerController _snackbarController;

  late final ShoppingsListRepositoryBase _shoppingsListRepository;

  Stream<ShoppingWithContext?> get shopping => _shopping.stream;

  Stream<List<Transaction>> get transactionsStream => _transactions.stream;

  ShoppingWithContext? get currentShoppingState => _shopping.value;

  List<Transaction> get transactions => _transactions.value;

  ShoppingDetailController(
    this._shoppingListController,
    this._transactionsRepository,
    this._snackbarController,
    this._shoppingsListRepository,
  ) {
    _listenForShoppingListChanges();
  }

  int? get _shoppingId => currentShoppingState?.shopping.id;

  void _listenForShoppingListChanges() {
    observeSocketEvents(
      eventStream: _shoppingsListRepository.getShoppingChangesStream,
      onValueChanged: (assignmentEvent) {
        if (currentShoppingState != null &&
            _shoppingId != null &&
            assignmentEvent.data.shopping.id == _shoppingId) {
          putShopping(_shoppingId!);
        }
      },
    );
  }

  Future<bool> putShopping(int shoppingId) async {
    var wasSuccess = false;
    final shopping =
        await _shoppingListController.shoppingById(shoppingId: shoppingId);
    if (shopping != null) {
      _shopping.add(shopping);
      wasSuccess = true;
    }
    return wasSuccess;
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
