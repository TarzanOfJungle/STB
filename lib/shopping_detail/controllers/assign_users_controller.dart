import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

const _SEARCH_QUERY_DEBOUNCE_MILLIS = 500;
const _USERS_ASSIGNED_MESSAGE = "Users assigned";
const _FAILED_TO_ASSIGN_USERS_MESSAGE =
    "Failed to assign some of the selected users";

class AssignUsersController {
  final BehaviorSubject<Map<int, User>> _usersToAdd =
      BehaviorSubject.seeded({});
  final BehaviorSubject<List<User>> _usersLookup = BehaviorSubject.seeded([]);
  final StreamController<String?> _usersSearchQuery =
      StreamController.broadcast();

  Stream<List<User>> get usersToAddStream =>
      _usersToAdd.stream.map((map) => map.values.toList());
  Stream<List<User>> get usersLookupStream =>
      _usersLookup.stream.map((usersFromLookup) {
        return _filterUserLookup(usersFromLookup);
      });

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  final AuthController _authController;
  final ShoppingDetailController _shoppingDetailController;
  final UsersRepositoryBase _usersRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  AssignUsersController(
    this._authController,
    this._shoppingDetailController,
    this._usersRepository,
    this._snackbarMessangerController,
  ) {
    _listenForUsersSearchQuery();
  }

  void _listenForUsersSearchQuery() {
    _usersSearchQuery.stream
        .debounceTime(
            const Duration(milliseconds: _SEARCH_QUERY_DEBOUNCE_MILLIS))
        .listen((query) async {
      if (query == null) {
        return;
      }
      final result = await _usersRepository.getUsers(searchQuery: query);
      _usersLookup.add(result);
    });
  }

  void addUser(User user) {
    final newUsersToAdd = {..._usersToAdd.value};
    newUsersToAdd[user.id] = user;
    _usersToAdd.add(newUsersToAdd);
  }

  void removeUser(User user) {
    final newUsersToAdd = {..._usersToAdd.value};
    if (newUsersToAdd.containsKey(user.id)) {
      newUsersToAdd.removeWhere((key, value) => key == user.id);
      _usersToAdd.add(newUsersToAdd);
    }
  }

  void resetState() {
    _usersToAdd.add({});
    _usersSearchQuery.add(null);
    _usersLookup.add([]);
  }

  void setUsersSearchQuery(String? searchQuery) {
    if (searchQuery == null || searchQuery.isEmpty) {
      _usersSearchQuery.add(null);
      _usersLookup.add([]);
      return;
    }
    _usersSearchQuery.add(searchQuery);
  }

  List<User> _filterUserLookup(List<User> usersToFilter) {
    return usersToFilter.where((userToFilter) {
      final alreadyAdded = _usersToAdd.value.containsKey(userToFilter.id);
      final isCurrentUser = userToFilter.id == _authController.loggedInUser?.id;
      return !alreadyAdded && !isCurrentUser;
    }).toList();
  }

  Future<bool> addSelectedUsers() async {
    final usersToAssign = _usersToAdd.value.values.toList();
    if (usersToAssign.isEmpty || _shoppingId == null) {
      return false;
    }
    try {
      final List<Future<void>> requests = [];
      for (var user in usersToAssign) {
        requests.add(_usersRepository.assignUserToShopping(
          userId: user.id,
          shoppingId: _shoppingId!,
        ));
      }
      await Future.wait(requests);
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _USERS_ASSIGNED_MESSAGE,
        category: SnackbarMessageCategory.SUCCESS,
      ));
      return true;
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_ASSIGN_USERS_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
      return false;
    }
  }
}
