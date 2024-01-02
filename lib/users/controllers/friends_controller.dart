import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/friendship_request_status.dart';
import 'package:split_the_bill/users/models/post_friendship_request/post_friendship_request.dart';
import 'package:split_the_bill/users/models/update_friendship_request_status/update_friendship_request_status.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/repositories/friendship_management_repository_base.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

const _FRIENDSHIP_REQUEST_STATUS_UPDATE_FAILED =
    "Failed to update friendship request status";
const _SENDING_FRIENDSHIP_REQUEST_FAILED = "Failed to request friendship";
const _CANCELLING_FRIENDSHIP_REQUEST_FAILED = "Failed to cancel friendship request";

class FriendsController with AuthenticatedSocketObserver {
  final BehaviorSubject<List<User>> _friends = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<User>> _nonFriendsSearch =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<String?> _nonFriendsSearchQuery =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<List<FriendshipRequest>> _friendshipRequests =
      BehaviorSubject.seeded([]);

  final AuthController _authController;
  final UsersRepositoryBase _usersRepository;
  final FriendshipManagementRepositoryBase _friendshipManagementRepository;
  final SnackbarMessangerController _snackbarController;

  Stream<List<User>> get friendsStream => _friends.stream;
  Stream<List<User>> get nonFriendsSearchStream => _nonFriendsSearch.stream;
  Stream<List<FriendshipRequest>> get allPendingFriendshipRequests =>
      _friendshipRequests.stream;
  Stream<List<FriendshipRequest>> get pendingFriendshipRequestsToAccept =>
      _friendshipRequests.stream.map((requests) => requests.where((request) {
            if (_authController.loggedInUser == null) {
              return false;
            }
            return request.acceptant.id == _authController.loggedInUser!.id;
          }).toList());

  FriendsController(
    this._authController,
    this._usersRepository,
    this._friendshipManagementRepository,
    this._snackbarController,
  ) {
    _listenForLoggedInUserChange();
    _listenForFriendshipManagementChanges();
    _listenForNonFriendsSearchQuery();
  }

  void _listenForFriendshipManagementChanges() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream:
          _friendshipManagementRepository.getFriendshipManagementChangesStream,
      onValueChanged: (friendshipManagementUpdate) {
        _loadFriends();
        _loadFriendshipRequests();
        searchNonFriendUsers(_nonFriendsSearchQuery.value);
      },
    );
  }

  void _listenForNonFriendsSearchQuery() {
    _nonFriendsSearchQuery.stream
        .debounceTime(ApiConstants.searchDebounce)
        .listen((query) async {
      if (query == null) {
        return;
      }
      final result = await _usersRepository.getUsers(
        searchQuery: query,
        friends: false,
        includeSelf: false,
      );
      _nonFriendsSearch.add(result);
    });
  }

  void _listenForLoggedInUserChange() {
    _authController.loggedInUserStream.listen((loggedInUser) async {
      if (loggedInUser != null) {
        _loadFriends();
        _loadFriendshipRequests();
      }
    });
  }

  Future<void> _loadFriends() async {
    try {
      final friends = await _usersRepository.getUsers(
        friends: true,
        includeSelf: false,
      );
      _friends.add(friends);
    } catch (_) {}
  }

  Future<void> _loadFriendshipRequests() async {
    try {
      var pendingFriendshipRequests =
          await _friendshipManagementRepository.getFriendshipRequests(
        status: FriendshipRequestStatus.PENDING,
      );
      _friendshipRequests.add(pendingFriendshipRequests);
    } catch (_) {}
  }

  Future<void> sendFriendshipRequest(int acceptantId) async {
    try {
      final friendshipRequestPost = PostFriendshipRequest(
        applicantId: _authController.loggedInUser!.id,
        acceptantId: acceptantId,
      );
      await _friendshipManagementRepository
          .createFriendshipRequest(friendshipRequestPost);
    } catch (_) {
      _snackbarController.showSnackbarMessage(SnackbarMessage(
        message: _SENDING_FRIENDSHIP_REQUEST_FAILED,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
  }

  Future<void> cancelFriendshipRequest(int acceptantId) async {
    try {
      await _friendshipManagementRepository
          .cancelFriendshipRequest(acceptantId);
    } catch (_) {
      _snackbarController.showSnackbarMessage(SnackbarMessage(
        message: _CANCELLING_FRIENDSHIP_REQUEST_FAILED,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
  }

  Future<void> updateFriendshipRequestStatus({
    required int applicantId,
    required bool accept,
  }) async {
    try {
      final friendshipRequestUpdate = UpdateFriendshipRequestStatus(
        applicantId: applicantId,
        acceptantId: _authController.loggedInUser!.id,
        accept: accept,
      );
      await _friendshipManagementRepository
          .updateFriendshipRequestStatus(friendshipRequestUpdate);
    } catch (_) {
      _snackbarController.showSnackbarMessage(SnackbarMessage(
        message: _FRIENDSHIP_REQUEST_STATUS_UPDATE_FAILED,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
  }

  void searchNonFriendUsers(String? searchQuery) {
    if (searchQuery == null || searchQuery.isEmpty) {
      _nonFriendsSearchQuery.add(null);
      _nonFriendsSearch.add([]);
      return;
    }
    _nonFriendsSearchQuery.add(searchQuery);
  }
}
