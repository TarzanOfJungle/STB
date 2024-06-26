import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

const String _FAILED_TO_LOAD_SHOPPING_MESSAGE =
    "Failed to load shopping detail";

class ShoppingDetailController with AuthenticatedSocketObserver {
  final BehaviorSubject<ShoppingWithContext?> _shopping =
      BehaviorSubject.seeded(null);

  int? get _shoppingId => currentShoppingState?.shopping.id;

  final AuthController _authController;
  final SnackbarMessangerController _snackbarController;
  final ShoppingsListRepositoryBase _shoppingsListRepository;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;
  final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  final UsersRepositoryBase _usersRepository;

  Stream<ShoppingWithContext?> get shopping => _shopping.stream;

  ShoppingWithContext? get currentShoppingState => _shopping.value;

  bool get userIsCreator =>
      currentShoppingState?.shopping.creatorId ==
      _authController.loggedInUser?.id;

  bool get shoppingIsFinalized =>
      currentShoppingState?.shopping.finalized ?? false;

  ShoppingDetailController(
    this._authController,
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

  void _listenForShoppingListChanges() {
    observeSocketEvents(
      eventStream: _shoppingsListRepository.getShoppingChangesStream,
      onValueChanged: (assignmentEvent) {
        if (_shoppingId != null &&
            assignmentEvent.data.shopping.id == _shoppingId) {
          if (assignmentEvent.event == WebsocketEvent.shoppingDeleted) {
            return;
          }
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
      final foundShopping =
          await _shoppingsListRepository.shoppingById(shoppingId: shoppingId);
      _shopping.add(foundShopping);
      return true;
    } catch (_) {
      _showError(_FAILED_TO_LOAD_SHOPPING_MESSAGE);
      _shopping.add(null);
      return false;
    }
  }

  void _showError(String errorMessage) {
    final message = SnackbarMessage(
      message: errorMessage,
      category: SnackbarMessageCategory.ERROR,
    );
    _snackbarController.showSnackbarMessage(message);
  }
}
