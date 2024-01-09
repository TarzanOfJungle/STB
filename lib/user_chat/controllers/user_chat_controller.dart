import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/user_chat/models/post_user_chat_message/post_user_chat_message.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message/user_chat_message.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message_with_users.dart';
import 'package:split_the_bill/user_chat/repositories/user_chat_repository_base.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const _FAILED_TO_LOAD_CHAT_MESSAGES = "Failed to load messages";
const _FAILED_TO_SEND_MESSAGE = "Failed to send message";
const _FAILED_TO_DELETE_MESSAGE = "Failed to delete message";

class UserChatController with AuthenticatedSocketObserver {
  final _otherUser = BehaviorSubject<User?>.seeded(null);
  final _loadedMessages = BehaviorSubject<List<UserChatMessage>>.seeded([]);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  final AuthController _authController;
  final FriendsController _friendsController;
  final UserChatRepositoryBase _userChatRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  User? get otherUser => _otherUser.value;
  Stream<User?> get otherUserStream => _otherUser.stream;
  Stream<List<UserChatMessageWithUsers>> get sortedMessagesWithUsersStream =>
      Rx.combineLatest3(
        _loadedMessages.stream,
        _friendsController.friendsStream,
        _authController.loggedInUserStream,
        (messages, friends, loggedInUser) => _getMappedUserChatMessages(
          userChatMessages: messages,
          friends: friends,
          loggedInUser: loggedInUser?.asUser(),
        ),
      );

  UserChatController(
    this._authController,
    this._userChatRepository,
    this._snackbarMessangerController,
    this._friendsController,
  ) {
    _listenForChatChanges();
  }

  void _listenForChatChanges() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream: _userChatRepository.getUserChatMessageChanges,
      onValueChanged: (e) {
        if (_otherUser.value == null || _authController.loggedInUser == null) {
          return;
        }
        final otherUserId = _otherUser.value!.id;
        final loggedInUserId = _authController.loggedInUser!.id;
        final concernsLoggedInUser = e.data.senderId == loggedInUserId ||
            e.data.receiverId == loggedInUserId;

        final concernsOtherUser =
            e.data.senderId == otherUserId || e.data.receiverId == otherUserId;
        if (concernsLoggedInUser && concernsOtherUser) {
          if (e.event == WebsocketEvent.userChatMessageReceived) {
            _onReceiveNewMessage(e.data);
          }
          if (e.event == WebsocketEvent.userChatMessageDeleted) {
            _onMessageDeleted(e.data);
          }
        }
      },
    );
  }

  Future<void> loadChatMessagesWithUser(User user) async {
    if (_isLoading.value) {
      return;
    }
    _isLoading.add(true);
    try {
      _otherUser.add(user);
      final messages =
          await _userChatRepository.getChatMessagesWithUser(user.id);
      _loadedMessages.add(messages);
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_LOAD_CHAT_MESSAGES,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
    _isLoading.add(false);
  }

  Future<bool> postNewMessage(String message) async {
    if (_isLoading.value || _otherUser.value == null) {
      return false;
    }
    _isLoading.add(true);
    var success = false;
    try {
      final messagePost = PostUserChatMessage(
        receiverId: _otherUser.value!.id,
        message: message,
      );
      await _userChatRepository.postMessage(messagePost);
      success = true;
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_SEND_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
    _isLoading.add(false);
    return success;
  }

  Future<void> deleteMessage(UserChatMessage message) async {
    if (_isLoading.value || _otherUser.value == null) {
      return;
    }
    _isLoading.add(true);
    try {
      await _userChatRepository.deleteMessage(message.id);
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_DELETE_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
    _isLoading.add(false);
  }

  void _onReceiveNewMessage(UserChatMessage message) {
    final messageAlreadyLoaded =
        _loadedMessages.value.where((m) => m.id == message.id).isNotEmpty;
    if (!messageAlreadyLoaded) {
      final newMessageList = [..._loadedMessages.value, message];
      _loadedMessages.add(newMessageList);
    }
  }

  void _onMessageDeleted(UserChatMessage message) {
    final newMessageList = [..._loadedMessages.value];
    newMessageList.removeWhere((m) => m.id == message.id);
    _loadedMessages.add(newMessageList);
  }

  List<UserChatMessageWithUsers> _getMappedUserChatMessages({
    required List<UserChatMessage> userChatMessages,
    required List<User> friends,
    required User? loggedInUser,
  }) {
    if (loggedInUser == null) {
      return [];
    }
    final allPossibleUsers = [...friends, loggedInUser];

    final messagesWithUsers = userChatMessages
        .map((m) {
          final sender =
              allPossibleUsers.where((u) => u.id == m.senderId).firstOrNull;
          final receiver =
              allPossibleUsers.where((u) => u.id == m.receiverId).firstOrNull;

          if (sender == null || receiver == null) {
            return null;
          }
          return UserChatMessageWithUsers(
            message: m,
            sender: sender,
            receiver: receiver,
          );
        })
        .where((u) => u != null)
        .map((u) => u!)
        .toList();
    messagesWithUsers.sort(
      (curr, next) => curr.message.created.compareTo(next.message.created),
    );
    return messagesWithUsers;
  }
}
