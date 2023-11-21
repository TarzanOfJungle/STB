import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/purchases/extensions/user_purchase_create_update.dart';
import 'package:split_the_bill/purchases/extensions/user_purchase_delete.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

class PurchasesController {
  final BehaviorSubject<ProductAssignmentsWithPurchases?>
      _productAssignmentsWithPurchases = BehaviorSubject.seeded(null);

  Stream<ProductAssignmentsWithPurchases?>
      get productAssignmentsWithPurchasesStream =>
          _productAssignmentsWithPurchases.stream;

  ProductAssignmentsWithPurchases? get productAssignmentsWithPurchases =>
      _productAssignmentsWithPurchases.value;

  late final ShoppingDetailController _shoppingDetailController;
  late final ProductAssignmentsRepositoryBase _productAssignmentsRepository;
  late final ProductPurchasesRepositoryBase _productPurchasesRepository;

  PurchasesController({
    required ShoppingDetailController shoppingDetailController,
    required ProductAssignmentsRepositoryBase productAssignmentsRepository,
    required ProductPurchasesRepositoryBase productPurchasesRepository,
  }) {
    _productAssignmentsRepository = productAssignmentsRepository;
    _productPurchasesRepository = productPurchasesRepository;
    _shoppingDetailController = shoppingDetailController;

    _shoppingDetailController.shopping.listen(
      (newShoppingState) {
        if (newShoppingState != null) {
          _fetchAssignmentsAndPurchases(newShoppingState.shopping.id);
        }
      },
    );
  }

  Future<void> _fetchAssignmentsAndPurchases(int shoppingId) async {
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

  void addOrUpdateUserPurchase({
    required int productId,
    required UserWithPurchaseContext userPurchase,
  }) {
    final newState = productAssignmentsWithPurchases?.withUserPurchase(
      productId: productId,
      userPurchase: userPurchase,
    );
    if (newState != null) {
      _productAssignmentsWithPurchases.add(newState);
    }
  }

  void deleteUserPurchase({
    required int productId,
    required int userId,
  }) {
    final newState = productAssignmentsWithPurchases?.withDeletedUserPurchase(
      productId: productId,
      userId: userId,
    );
    if (newState != null) {
      _productAssignmentsWithPurchases.add(newState);
    }
  }
}
