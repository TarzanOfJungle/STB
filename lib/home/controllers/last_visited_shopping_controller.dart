import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/config/hive/hive_constants.dart';
import 'package:split_the_bill/common/config/hive/hive_utils.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';

class LastVisitedShoppingController {
  final BehaviorSubject<ShoppingWithContext?> _lastVisitedShopping =
      BehaviorSubject.seeded(null);

  Stream<ShoppingWithContext?> get lastVisitedShoppingStream =>
      _lastVisitedShopping.stream;

  final AuthController _authController;
  final ShoppingDetailController _shoppingDetailController;
  final ShoppingsListRepositoryBase _shoppingsRepository;

  LastVisitedShoppingController(
    this._authController,
    this._shoppingDetailController,
    this._shoppingsRepository,
  ) {
    _listenForLoggedInUserChanges();
    _listenForShoppingDetailChanges();
  }

  void _listenForLoggedInUserChanges() {
    _authController.loggedInUserStream.listen((loggedInUser) {
      if (loggedInUser != null) {
        _recoverLastVisitedShoppingFromCache(loggedInUser.id);
      } else {
        _lastVisitedShopping.add(null);
      }
    });
  }

  void _listenForShoppingDetailChanges() {
    _shoppingDetailController.shopping.listen((selectedShopping) {
      if (selectedShopping != null) {
        _lastVisitedShopping.add(selectedShopping);
        _saveLastVisitedShopping(selectedShopping.shopping.id);
      }
    });
  }

  Future<void> _recoverLastVisitedShoppingFromCache(int userId) async {
    HiveUtils.doInBoxScope<int>(
      boxKey: HiveConstants.LAST_VISITED_SHOPPING_IDS_BOX_KEY,
      boxScope: (lastVisitedShoppingIdsBox) async {
        final foundId = lastVisitedShoppingIdsBox.get(userId);
        if (foundId != null) {
          final recoveredShopping = await _getShoppingById(foundId);
          _lastVisitedShopping.add(recoveredShopping);
        }
      },
    );
  }

  Future<ShoppingWithContext?> _getShoppingById(int shoppingId) async {
    try {
      return await _shoppingsRepository.shoppingById(shoppingId: shoppingId);
    } catch (_) {
      return null;
    }
  }

  Future<void> _saveLastVisitedShopping(int shoppingId) async {
    final loggedInUserId = _authController.loggedInUser?.id;
    if (loggedInUserId != null) {
      HiveUtils.doInBoxScope<int>(
          boxKey: HiveConstants.LAST_VISITED_SHOPPING_IDS_BOX_KEY,
          boxScope: (lastVisitedShoppingIdsBox) =>
              lastVisitedShoppingIdsBox.put(loggedInUserId, shoppingId));
    }
  }
}
