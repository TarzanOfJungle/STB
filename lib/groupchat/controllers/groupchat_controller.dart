import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/groupchat/models/groupchat_message/groupchat_message.dart';
import 'package:split_the_bill/groupchat/models/groupchat_message_with_author.dart';
import 'package:split_the_bill/groupchat/models/post_groupchat_message/post_groupchat_message.dart';
import 'package:split_the_bill/groupchat/repositories/groupchat_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';

const _FAILED_TO_LOAD_CHAT_MESSAGE = "Failed to load messages";
const _FAILED_TO_SEND_MESSAGE = "Failed to send message";
const _FAILED_TO_DELETE_MESSAGE = "Failed to delete message";

class GroupchatController with AuthenticatedSocketObserver {
  final _loadedMessages = BehaviorSubject<List<GroupchatMessage>>.seeded([]);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  final ShoppingDetailController _shoppingDetailController;
  final ShoppingMembersController _shoppingMembersController;
  final GroupchatRepositoryBase _groupchatRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  Stream<List<GroupchatMessageWithAuthor>> get sortedMessagesStream =>
      Rx.combineLatest2(
        _loadedMessages.stream,
        _shoppingMembersController.shoppingMembersStream,
        (messages, members) {
          final messagesWithAuthors = messages.map((m) {
            final authorOfMessage =
                members.where((u) => u.id == m.userId).firstOrNull;
            return GroupchatMessageWithAuthor(
              message: m,
              author: authorOfMessage,
            );
          }).toList();
          messagesWithAuthors.sort(
            (curr, next) =>
                curr.message.created.compareTo(next.message.created),
          );
          return messagesWithAuthors;
        },
      );

  GroupchatController(
    this._shoppingDetailController,
    this._shoppingMembersController,
    this._groupchatRepository,
    this._snackbarMessangerController,
  ) {
    _listenForShoppingDetailChanges();
    _listenForGroupchatChanges();
  }

  void _listenForShoppingDetailChanges() {
    _shoppingDetailController.shopping.listen(
      (newShoppingState) {
        if (newShoppingState != null) {
          _isLoading.add(false);
          _loadedMessages.add([]);
          _loadGroupchatMessages(newShoppingState.shopping.id);
        }
      },
    );
  }

  void _listenForGroupchatChanges() {
    cancelAllSubscribtions();
    observeSocketEvents(
      eventStream: _groupchatRepository.getMessageChangesStream,
      onValueChanged: (change) {
        if (_shoppingId == null || change.data.shoppingId != _shoppingId) {
          return;
        }
        if (change.event == WebsocketEvent.groupchatMessageReceived) {
          _onReceiveNewMessage(change.data);
        }
        if (change.event == WebsocketEvent.groupchatMessageDeleted) {
          _onMessageDeleted(change.data);
        }
      },
    );
  }

  Future<void> _loadGroupchatMessages(int shoppingId) async {
    if (_isLoading.value) {
      return;
    }
    _isLoading.add(true);
    try {
      final messages =
          await _groupchatRepository.getMessagesOfShopping(shoppingId);
      _loadedMessages.add(messages);
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_LOAD_CHAT_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
    _isLoading.add(false);
  }

  Future<bool> postNewMessage(String message) async {
    if (_isLoading.value || _shoppingId == null) {
      return false;
    }
    _isLoading.add(true);
    var success = false;
    try {
      final messagePost = PostGroupchatMessage(
        shoppingId: _shoppingId!,
        message: message,
      );
      await _groupchatRepository.postMessage(messagePost);
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

  Future<void> deleteMessage(GroupchatMessage message) async {
    if (_isLoading.value || _shoppingId == null) {
      return;
    }
    _isLoading.add(true);
    try {
      await _groupchatRepository.deleteMessage(message.id);
    } catch (_) {
      _snackbarMessangerController.showSnackbarMessage(SnackbarMessage(
        message: _FAILED_TO_DELETE_MESSAGE,
        category: SnackbarMessageCategory.ERROR,
      ));
    }
    _isLoading.add(false);
  }

  void _onReceiveNewMessage(GroupchatMessage message) {
    final messageAlreadyLoaded =
        _loadedMessages.value.where((m) => m.id == message.id).isNotEmpty;
    if (!messageAlreadyLoaded) {
      final newMessageList = [..._loadedMessages.value, message];
      _loadedMessages.add(newMessageList);
    }
  }

  void _onMessageDeleted(GroupchatMessage message) {
    final newMessageList = [..._loadedMessages.value];
    newMessageList.removeWhere((m) => m.id == message.id);
    _loadedMessages.add(newMessageList);
  }
}
