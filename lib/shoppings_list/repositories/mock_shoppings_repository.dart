import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/shopping_detail/models/shopping/shopping.dart';
import 'package:split_the_bill/shopping_detail/models/update_shopping/update_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/post_shopping/post_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';

class MockShoppingsRepository implements ShoppingsListRepositoryBase {
  static const List<ShoppingWithContext> _mockShoppings = [
    ShoppingWithContext(
      shopping: Shopping(
        id: 0,
        name: 'Shopping 1',
        creatorId: 007,
        description: 'This is description.',
      ),
      numberOfItems: 5,
      ammountSpent: 73791,
      numberOfParticipants: 2,
    ),
    ShoppingWithContext(
      shopping: Shopping(
        id: 1,
        name: 'Shopping 2',
        creatorId: 69,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      ),
      numberOfItems: 12,
      ammountSpent: 0,
      numberOfParticipants: 6,
    ),
  ];

  @override
  Future<Iterable<ShoppingWithContext>> getShoppings({String? searchQuery}) {
    return Future.delayed(const Duration(seconds: 1), () {
      return _mockShoppings
          .where((shopping) => shopping.shopping.name.contains(searchQuery ?? ''));
    });
  }

  @override
  Future<ShoppingWithContext> addShopping({required PostShopping postShopping}) {
    // TODO: implement addShopping
    throw UnimplementedError();
  }

  @override
  Future<ShoppingWithContext> shoppingById({required int shoppingId}) {
    // TODO: implement shoppingById
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteShopping({required int shoppingId}) {
    // TODO: implement deleteShopping
    throw UnimplementedError();
  }

  @override
  Future<ShoppingWithContext> updateShopping({required UpdateShopping updateShopping}) {
    // TODO: implement updateShopping
    throw UnimplementedError();
  }

  @override
  Stream<WebsocketEventWithData<ShoppingWithContext>> getShoppingChangesStream() {
    // TODO: implement getShoppingChangesStream
    throw UnimplementedError();
  }
}
