import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/models/put_product_shopping_assignment/put_product_shopping_assignment.dart';

abstract class ProductAssignmentsRepositoryBase {
  Future<List<ProductShoppingAssignment>> getProductAssignmentsOfShopping(
      int shoppingId);

  Future<void> deleteProductAssignmentFromShopping(
      int shoppingId, String productName);

  Future<ProductShoppingAssignment> addOrUpdateProductAssignment(
      PutProductShoppingAssignment putProductAssignment);
}
