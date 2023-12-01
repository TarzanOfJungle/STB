import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/controllers/snackbar_messanger_controller.dart';
import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';

const String _FETCH_TRANSACTIONS_ERROR_MESSAGE = 'Unable to update transactions';

class ShoppingDetailController {
  final BehaviorSubject<ShoppingWithContext?> _shopping =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<List<Transaction>> _transactions =
      BehaviorSubject.seeded([]);

  late final ShoppingsListController _shoppingListController;
  late final TrasactionsRepositoryBase _transactionsRepository;
  late final SnackbarMessangerController _snackbarController;


  ShoppingDetailController({
    required ShoppingsListController shoppingsListController,
    required TrasactionsRepositoryBase trasactionsRepository,
    required SnackbarMessangerController snackbarMessangerController,
  }) {
    _shoppingListController = shoppingsListController;
    _transactionsRepository = trasactionsRepository;
    _snackbarController = snackbarMessangerController;
  }

  Stream<ShoppingWithContext?> get shopping => _shopping.stream;

  Stream<List<Transaction>> get transactionsStream => _transactions.stream;

  ShoppingWithContext? get currentShoppingState => _shopping.value;
  List<Transaction> get transactions => _transactions.value;

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
          await _transactionsRepository.getTransactionsOfShopping(shoppingId: currentShoppingState!.shopping.id);
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
