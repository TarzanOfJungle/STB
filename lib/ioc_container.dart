import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/repositories/auth_repository.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/auth/services/token_validation_service.dart';
import 'package:split_the_bill/common/api/api_client.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/groupchat/repositories/group_chat_repository.dart';
import 'package:split_the_bill/groupchat/repositories/group_chat_repository_base.dart';
import 'package:split_the_bill/products/repositories/products_repository.dart';
import 'package:split_the_bill/products/repositories/products_repository_base.dart';
import 'package:split_the_bill/purchases/controllers/product_lookup_controller.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_repository_base.dart';
import 'package:split_the_bill/common/services/internet_connectivity_service.dart';

final get = GetIt.instance;

abstract class IocContainer {
  static void setUpIoc() {
    get.registerSingleton<ApiClientBase>(ApiClient());
    get.registerSingleton<Connectivity>(Connectivity());

    // Repositories
    get.registerSingleton<AuthRepositoryBase>(
        AuthRepository(get<ApiClientBase>()));

    get.registerSingleton<ShoppingsRepositoryBase>(
        ShoppingsListRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductAssignmentsRepositoryBase>(
        ProductAssignmentsRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductPurchasesRepositoryBase>(
        ProductPurchasesRepository(get<ApiClientBase>()));
    get.registerSingleton<GroupChatRepositoryBase>(
        GroupChatRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductsRepositoryBase>(
        ProductsRepository(get<ApiClientBase>()));

    // Controllers and services
    get.registerSingleton<SnackbarMessangerController>(
        SnackbarMessangerController());
    get.registerSingleton<AuthController>(
      AuthController(
        client: get<ApiClientBase>(),
        authRepository: get<AuthRepositoryBase>(),
        snackbarMessangerController: get<SnackbarMessangerController>(),
      ),
    );

    get.registerSingleton<ProductLookupController>(
        ProductLookupController(get<ProductsRepositoryBase>()));
    get.registerSingleton<ShoppingsListController>(
      ShoppingsListController(
          shoppingsListRepository: get<ShoppingsRepositoryBase>(),
          snackbarMessangerController: get<SnackbarMessangerController>()),
    );
    get.registerSingleton<ShoppingDetailController>(ShoppingDetailController(
        shoppingsListController: get<ShoppingsListController>()));
    get.registerSingleton<PurchasesController>(PurchasesController(
      get<ShoppingDetailController>(),
      get<SnackbarMessangerController>(),
      get<ProductAssignmentsRepositoryBase>(),
      get<ProductPurchasesRepositoryBase>(),
    ));
    get.registerSingleton<SinglePurchaseController>(SinglePurchaseController(
      get<AuthController>(),
      get<ProductPurchasesRepositoryBase>(),
      get<SnackbarMessangerController>(),
    ));

    get.registerSingleton<TokenValidationService>(TokenValidationService(
      authController: get<AuthController>(),
      apiClient: get<ApiClientBase>(),
      authRepository: get<AuthRepositoryBase>(),
    ));
    get.registerSingleton<InternetConnectivityService>(
        InternetConnectivityService(get<Connectivity>()));

    // Router
    get.registerSingleton<NavRouter>(NavRouter(
      singlePurchaseController: get<SinglePurchaseController>(),
      shoppingDetailController: get<ShoppingDetailController>(),
    ));
  }
}
