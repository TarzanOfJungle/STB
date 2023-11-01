import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

abstract class ShoppingsRepositoryBase {
  Future<Iterable<ShoppingWithContext>> getShoppings(String searchQuery);
}