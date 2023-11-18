import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';

class PurchasesController {
  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _productAssignmentsWithPurchases = BehaviorSubject.seeded(null);

  Stream<ProductAssignmentsWithPurchases?>
      get productsAssignmentsWithPurchases =>
          _productAssignmentsWithPurchases.stream;

  late final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  late final ProductPurchasesRepositoryBase _productPurchasesRepository;

  PurchasesController({
    required ProductAssignmentsRepositoryBase productAssignmentsRepository,
    required ProductPurchasesRepositoryBase productPurchasesRepository,
  }) {
    _productAssignmentsRepository = productAssignmentsRepository;
    _productPurchasesRepository = productPurchasesRepository;

    // TODO: only for testing purposes, replace with subscribtion to ShoppingDetailController once implemented
    Future.delayed(
      const Duration(seconds: 25),
      () {
        fetchAssignmentsAndPurchases(1);
      },
    ).then((value) => null);
  }

  Future<void> fetchAssignmentsAndPurchases(int shoppingId) async {
    _productAssignmentsWithPurchases.add(null);
    try {
      final productAssignments = await _productAssignmentsRepository
          .getProductAssignmentsOfShopping(shoppingId);
      final productPurchases = await _productPurchasesRepository
          .getProductPurchasesOfShopping(shoppingId);

      final assignmentsWithPurchases = ProductAssignmentsWithPurchases(
        productAssignments: productAssignments,
        productPurchases: productPurchases,
      );
      _productAssignmentsWithPurchases.add(assignmentsWithPurchases);
    } catch (_) {
      _productAssignmentsWithPurchases.add(
        ProductAssignmentsWithPurchases.empty(),
      );
    }
  }
}
