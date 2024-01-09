import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/models/update_shopping/update_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/post_shopping/post_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

import '../../common/controllers/snackbar_messanger_controller.dart';
import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';

const String _LIST_UPDATE_ERROR_MESSAGE = "Unable to update list of shoppings";
const String _ADDING_SHOPPING_ERROR_MESSAGE = "Error while adding new shopping";
const String _INVALID_PARAMETERS_MESSAGE = "Invalid shopping parameters";
const String _DEFAULT_EXCEPTION_MESSAGE = "Something went wrong";

class ShoppingsListController with AuthenticatedSocketObserver {
  final BehaviorSubject<Iterable<ShoppingWithContext>> _shoppingsList =
      BehaviorSubject.seeded([]);

  final BehaviorSubject<ShoppingWithContext?> _lastUpdatedShopping =
      BehaviorSubject.seeded(null);

  final ShoppingsListRepositoryBase _shoppingsListRepository;
  final SnackbarMessangerController _snackbarController;
  final ProductPurchasesRepositoryBase _productPurchasesRepository;
  final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  final UsersRepositoryBase _usersRepository;

  Stream<Iterable<ShoppingWithContext>> get shoppingsListStream =>
      _shoppingsList.stream;

  Stream<ShoppingWithContext?> get lastUpdatedShopping =>
      _lastUpdatedShopping.stream;

  ShoppingsListController(
    this._shoppingsListRepository,
    this._snackbarController,
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
        updateShoppingsList();
      },
    );
  }

  void _listenForUsersChanges() {
    observeSocketEvents(
      eventStream: _usersRepository.getUserShoppingAssignmentChangesStream,
      onValueChanged: (assignmentEvent) {
        updateShoppingsList();
      },
    );
  }

  void _listenForPurchaseAndAssignmentChanges() {
    observeSocketEvents(
      eventStream: _productPurchasesRepository.getPurchaseChangesStream,
      onValueChanged: (assignmentEvent) {
        updateShoppingsList();
      },
    );
    observeSocketEvents(
      eventStream:
          _productAssignmentsRepository.getProductAssignmentChangesStream,
      onValueChanged: (assignmentEvent) {
        updateShoppingsList();
      },
    );
  }

  Future<bool> updateShoppingsList({String? searchQuery}) async {
    var wasSuccess = false;
    try {
      final shoppingList =
          await _shoppingsListRepository.getShoppings(searchQuery: searchQuery);
      _shoppingsList.add(shoppingList);
      wasSuccess = true;
    } catch (_) {
      _showError(_LIST_UPDATE_ERROR_MESSAGE);
    }
    return wasSuccess;
  }

  Future<bool> addShopping({required PostShopping postShopping}) async {
    var wasSuccess = false;
    try {
      var newShopping = await _shoppingsListRepository.addShopping(
          postShopping: postShopping);
      _lastUpdatedShopping.add(newShopping);
      wasSuccess = true;
    } on ApiClientException catch (_) {
      _showError(_INVALID_PARAMETERS_MESSAGE);
    } catch (_) {
      _showError(_ADDING_SHOPPING_ERROR_MESSAGE);
    }
    return wasSuccess;
  }

  Future<ShoppingWithContext?> shoppingById({required int shoppingId}) async {
    try {
      var shopping =
          await _shoppingsListRepository.shoppingById(shoppingId: shoppingId);
      return shopping;
    } catch (_) {
      _showError(_DEFAULT_EXCEPTION_MESSAGE);
    }
    return null;
  }

  Future<bool> deleteShopping({required int shoppingId}) async {
    var wasSuccess = false;
    try {
      wasSuccess =
          await _shoppingsListRepository.deleteShopping(shoppingId: shoppingId);
    } catch (_) {
      _showError(_DEFAULT_EXCEPTION_MESSAGE);
    }
    return wasSuccess;
  }

  Future<bool> updateShopping(
      {required PostShopping postShopping, required int shoppingId}) async {
    var wasSuccess = false;
    try {
      UpdateShopping update = UpdateShopping(
          id: shoppingId,
          name: postShopping.name,
          updateDue: true,
          due: DateTime.now(),
          updateDescription: true,
          description: postShopping.description);
      var shopping =
          await _shoppingsListRepository.updateShopping(updateShopping: update);
      _lastUpdatedShopping.add(shopping);
      wasSuccess = true;
    } catch (_) {
      _showError(_DEFAULT_EXCEPTION_MESSAGE);
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
