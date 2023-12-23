import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';
import 'package:split_the_bill/groupchat/models/group_chat_message/group_chat_message.dart';
import 'package:split_the_bill/groupchat/models/post_group_chat_message/post_group_chat_message.dart';
import 'package:split_the_bill/groupchat/repositories/group_chat_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

const _FAILED_TO_LOAD_CHAT_MESSAGE = "Failed to load messages";
const _FAILED_TO_SEND_MESSAGE = "Failed to send message";

class GroupchatController with AuthenticatedSocketObserver {
  final _loadedMessages = BehaviorSubject<List<GroupChatMessage>>.seeded([]);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);
  final ShoppingDetailController _shoppingDetailController;
  final GroupChatRepositoryBase _groupchatRepository;
  final SnackbarMessangerController _snackbarMessangerController;

  int? get _shoppingId =>
      _shoppingDetailController.currentShoppingState?.shopping.id;

  Stream<List<GroupChatMessage>> get sortedMessagesStream =>
      _loadedMessages.stream.map((messages) {
        final sorted = [...messages];
        sorted.sort((current, next) => current.created.compareTo(next.created));
        return sorted;
      });

  GroupchatController(
    this._shoppingDetailController,
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
      final messagePost = PostGroupChatMessage(
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

  void _onReceiveNewMessage(GroupChatMessage message) {
    final messageAlreadyLoaded =
        _loadedMessages.value.where((m) => m.id == message.id).isNotEmpty;
    if (!messageAlreadyLoaded) {
      final newMessageList = [..._loadedMessages.value, message];
      _loadedMessages.add(newMessageList);
    }
  }

  void _onMessageDeleted(GroupChatMessage message) {
    final newMessageList = [..._loadedMessages.value];
    newMessageList.removeWhere((m) => m.id == message.id);
    _loadedMessages.add(newMessageList);
  }
}
