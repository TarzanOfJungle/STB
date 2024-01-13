import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

const _USERS_ASSIGNED_MESSAGE = "Users assigned";
const _FAILED_TO_ASSIGN_USERS_MESSAGE =
    "Failed to assign some of the selected users";
const _FAILED_TO_UNASSIGN_USER = "Failed to unassign this user";

class ShoppingMembersController with AuthenticatedSocketObserver {
  final BehaviorSubject<Map<int, User>> _shoppingMembers =
      BehaviorSubject.seeded({});
  final BehaviorSubject<Map<int, User>> _usersToAdd =
      BehaviorSubject.seeded({});
  final BehaviorSubject<List<User>> _usersLookup = BehaviorSubject.seeded([]);
  final StreamController<String?> _usersSearchQuery =
      StreamController.broadcast();

  Stream<List<User>> get shoppingMembersStream =>
      _shoppingMembers.stream.map((members) => members.values.toList());
  Stream<List<User>> get usersToAddStream =>
      _usersToAdd.stream.map((map) => map.values.toList());
  Stream<List<User>> get usersLookupStream =>
      _usersLookup.stream.map((usersFromLookup) {
        return _filterUserLookup(usersFromLookup);
      });

  List<User> get shoppingMembers => _shoppingMembers.value.values.toList();

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  final AuthController _authController;
  final ShoppingDetailController _shoppingDetailController;
  final UsersRepositoryBase _usersRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  ShoppingMembersController(
    this._authController,
    this._shoppingDetailController,
    this._usersRepository,
    this._snackbarMessangerController,
  ) {
    _listenForShoppingMembersChanges();
    _listenForUsersSearchQuery();
  }

  void _listenForShoppingMembersChanges() {
    cancelAllSubscribtions();
    _shoppingDetailController.shopping.listen((selectedShopping) {
      if (selectedShopping != null) {
        _refreshShoppingMembers(selectedShopping.shopping.id);
      } else {
        _shoppingMembers.add({});
      }
    });
    observeSocketEvents(
      eventStream: _usersRepository.getUserShoppingAssignmentChangesStream,
      onValueChanged: (assignmentEvent) {
        if (_shoppingId != null &&
            assignmentEvent.data.shoppingId == _shoppingId) {
          _refreshShoppingMembers(_shoppingId!);
        }
      },
    );
  }

  void _listenForUsersSearchQuery() {
    _usersSearchQuery.stream
        .debounceTime(ApiConstants.searchDebounce)
        .listen((query) async {
      if (query == null) {
        return;
      }
      final result =
          await _usersRepository.getUsers(searchQuery: query, friends: true);
      _usersLookup.add(result);
    });
  }

  Future<void> _refreshShoppingMembers(int shoppingId) async {
    try {
      final shoppingMembers =
          await _usersRepository.getUsers(shoppingId: shoppingId);
      final shoppingMembersMap = Map.fromEntries(
          shoppingMembers.map((member) => MapEntry(member.id, member)));
      _shoppingMembers.add(shoppingMembersMap);
    } catch (_) {
      return;
    }
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

  void resetUserAssignment() {
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
      final alreadyToAdd = _usersToAdd.value.containsKey(userToFilter.id);
      final alreadyMember = _shoppingMembers.value.containsKey(userToFilter.id);
      final isCurrentUser = userToFilter.id == _authController.loggedInUser?.id;
      return !alreadyToAdd && !alreadyMember && !isCurrentUser;
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
      resetUserAssignment();
      return true;
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_ASSIGN_USERS_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
      return false;
    }
  }

  Future<void> unassignUser(User user) async {
    try {
      await _usersRepository.unassignUserFromShopping(
        userId: user.id,
        shoppingId: _shoppingId!,
      );
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_UNASSIGN_USER,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
  }
}
