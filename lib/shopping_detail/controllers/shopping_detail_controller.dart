import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class ShoppingDetailController {
  final BehaviorSubject<ShoppingWithContext?> _shopping =
      BehaviorSubject.seeded(null);
  late final ShoppingsListController _shoppingListController;

  ShoppingDetailController(
      {required ShoppingsListController shoppingsListController}) {
    _shoppingListController = shoppingsListController;
  }

  Stream<ShoppingWithContext?> get shopping => _shopping.stream;
  ShoppingWithContext? get currentShoppingState => _shopping.value;

  Future<bool> putShopping(int shoppingId) async {
    var wasSuccess = false;
    final shopping =
        await _shoppingListController.shoppingById(shoppingId: shoppingId);
    if (shopping != null) {
      _shopping.add(shopping);
      wasSuccess = true;
    }
    return wasSuccess;
  }
}
