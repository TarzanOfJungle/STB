import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/models/transaction/transaction.dart';
import 'package:split_the_bill/shopping_detail/models/transaction_with_users.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

const String _FETCH_TRANSACTIONS_ERROR_MESSAGE =
    'Unable to update transactions';

class UserTransactionsDisplayController with AuthenticatedSocketObserver {
  final BehaviorSubject<User?> _selectedUser = BehaviorSubject.seeded(null);
  final BehaviorSubject<List<Transaction>> _transactions =
      BehaviorSubject.seeded([]);

  Stream<User?> get selectedUserStream => _selectedUser.stream;

  Stream<List<Transaction>> get _transactionsFiltered => Rx.combineLatest2(
      _transactions.stream,
      _selectedUser.stream,
      (transactions, user) => _getFilteredTransactions(user, transactions));

  Stream<List<TransactionWithUsers>> get filteredTransactionsWithUsersStream =>
      Rx.combineLatest2(
          _transactionsFiltered,
          _shoppingMembersController.shoppingMembersStream,
          (transactions, members) =>
              _getCombinedTransactionsWithUsers(transactions, members));

  List<TransactionWithUsers> get allTransactionsWithUsers =>
      _getCombinedTransactionsWithUsers(
          _transactions.value, _shoppingMembersController.shoppingMembers);

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  final ShoppingDetailController _shoppingDetailController;
  final ShoppingMembersController _shoppingMembersController;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;
  final UsersRepositoryBase _usersRepository;
  final SnackbarMessangerController _snackbarController;
  final TransactionsRepositoryBase _transactionsRepository;

  UserTransactionsDisplayController(
    this._shoppingDetailController,
    this._shoppingMembersController,
    this._snackbarController,
    this._transactionsRepository,
    this._productPurchasesRepository,
    this._usersRepository,
  ) {
    _listenForShoppingDetailChanges();
    _listenForPurchasesAndShoppingMembersChanges();
  }

  void _listenForShoppingDetailChanges() {
    _shoppingDetailController.shopping.listen((selectedShopping) {
      if (selectedShopping != null) {
        _selectedUser.add(null);
        _loadTransactions(selectedShopping.shopping.id);
      }
    });
  }

  void _listenForPurchasesAndShoppingMembersChanges() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream: _productPurchasesRepository.getPurchaseChangesStream,
      onValueChanged: (newValue) {
        final changedShoppingId = newValue.data.shoppingId;
        if (changedShoppingId == _shoppingId) {
          _loadTransactions(changedShoppingId);
        }
      },
    );
    observeSocketEvents(
      eventStream: _usersRepository.getUserShoppingAssignmentChangesStream,
      onValueChanged: (newValue) {
        final changedShoppingId = newValue.data.shoppingId;
        if (changedShoppingId == _shoppingId) {
          _loadTransactions(changedShoppingId);
        }
      },
    );
  }

  void selectUser(User? user) {
    _selectedUser.add(user);
  }

  Future<bool> _loadTransactions(int shoppingId) async {
    var wasSuccess = false;
    try {
      final transactions = await _transactionsRepository
          .getTransactionsOfShopping(shoppingId: shoppingId);
      _transactions.add(transactions);
      wasSuccess = true;
    } catch (_) {
      _transactions.add([]);
      _snackbarController.showSnackbarMessage(SnackbarMessage(
        message: _FETCH_TRANSACTIONS_ERROR_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
    return wasSuccess;
  }

  List<TransactionWithUsers> _getCombinedTransactionsWithUsers(
    List<Transaction> transactions,
    List<User> shoppingMembers,
  ) {
    return transactions.map((transaction) {
      final payingUser = shoppingMembers
          .where((member) => member.id == transaction.payingUserId)
          .firstOrNull;
      final payedUser = shoppingMembers
          .where((member) => member.id == transaction.payedUserId)
          .firstOrNull;
      return TransactionWithUsers(transaction, payingUser, payedUser);
    }).toList();
  }

  List<Transaction> _getFilteredTransactions(
    User? selectedUser,
    List<Transaction> allTransactions,
  ) {
    if (selectedUser == null) {
      return allTransactions;
    }
    return allTransactions
        .where((t) =>
            t.payingUserId == selectedUser.id ||
            t.payedUserId == selectedUser.id)
        .toList();
  }
}
