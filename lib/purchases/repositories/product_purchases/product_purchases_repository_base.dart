import 'package:split_the_bill/common/api/websocket_event_with_data.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/purchase_changed/purchase_changed.dart';
import 'package:split_the_bill/purchases/models/put_product_purchase/put_product_purchase.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';

abstract class ProductPurchasesRepositoryBase {
  Future<List<ProductPurchase>> getProductPurchasesOfShopping(int shoppingId);

  Future<void> deleteProductPurchase(int shoppingId, int productId);

  Future<void> addOrUpdateProductPurchase(PutProductPurchase productPurchase);

  Future<List<UserPurchases>> getUserPurchasesOfShopping(int shoppingId);

  Stream<WebsocketEventWithData<PurchaseChanged>> getPurchaseChangesStream();
}
