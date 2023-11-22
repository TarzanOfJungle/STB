import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/put_product_purchase/put_product_purchase.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';

abstract class ProductPurchasesRepositoryBase {
  Future<List<ProductPurchase>> getProductPurchasesOfShopping(int shoppingId);

  Future<void> deleteProductPurchase(int shoppingId, int productId);

  Future<void> addOrUpdateProductPurchase(PutProductPurchase productPurchase);

  Future<List<UserPurchases>> getUserPurchasesOfShopping(int shoppingId);
}
