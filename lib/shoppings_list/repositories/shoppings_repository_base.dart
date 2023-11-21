import 'package:split_the_bill/shopping_detail/models/update_shopping/update_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/post_shopping/post_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

abstract class ShoppingsRepositoryBase {
  Future<Iterable<ShoppingWithContext>> getShoppings({String? searchQuery});
  Future<ShoppingWithContext> addShopping({required PostShopping postShopping});
  Future<ShoppingWithContext> shoppingById({required int shoppingId});
  Future<bool> deleteShopping({required int shoppingId});
  Future<ShoppingWithContext> updateShopping({required UpdateShopping updateShopping});
}
