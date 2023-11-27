import 'package:split_the_bill/products/models/product/product.dart';

abstract class ProductsRepositoryBase {
  
  Future<List<Product>> getProducts({
    String? name,
    int? shoppingId,
    int? creatorId,
  });
}
