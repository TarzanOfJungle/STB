import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/products/models/product/product.dart';
import 'package:split_the_bill/products/repositories/products_repository_base.dart';

const _SEARCH_QUERY_DEBOUNCE_MILLIS = 600;

class ProductLookupController {
  final StreamController<String?> _productNameSearchQuery =
      StreamController.broadcast();

  final BehaviorSubject<List<Product>> _productLookup =
      BehaviorSubject.seeded([]);

  Stream<List<Product>> get productLookup => _productLookup.stream;

  final ProductsRepositoryBase _productsRepository;

  ProductLookupController(this._productsRepository) {
    _listenForProductSearchQuery();
  }

  void _listenForProductSearchQuery() {
    _productNameSearchQuery.stream
        .debounceTime(
            const Duration(milliseconds: _SEARCH_QUERY_DEBOUNCE_MILLIS))
        .listen((query) async {
      if (query == null) {
        _productLookup.add([]);
        return;
      }
      final result = await _productsRepository.getProducts(name: query);
      _productLookup.add(result);
    });
  }

  void setProductNameSearchQuery(String? searchQuery) {
    _productNameSearchQuery.add(searchQuery);
  }
}
