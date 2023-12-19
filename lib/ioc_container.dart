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
import 'package:split_the_bill/common/controllers/fcm_controller.dart';
import 'package:split_the_bill/groupchat/repositories/group_chat_repository.dart';
import 'package:split_the_bill/groupchat/repositories/group_chat_repository_base.dart';
import 'package:split_the_bill/products/repositories/products_repository.dart';
import 'package:split_the_bill/products/repositories/products_repository_base.dart';
import 'package:split_the_bill/purchases/controllers/add_product_assignment_controller.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_repository_base.dart';
import 'package:split_the_bill/common/services/internet_connectivity_service.dart';
import 'package:split_the_bill/users/repositories/users_reposiory.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

final get = GetIt.instance;

abstract class IocContainer {
  static void setUpIoc() {
    get.registerSingleton<ApiClientBase>(ApiClient());
    get.registerSingleton<Connectivity>(Connectivity());
    get.registerSingleton<InternetConnectivityService>(
        InternetConnectivityService(get<Connectivity>()));

    // Repositories
    get.registerSingleton<AuthRepositoryBase>(
        AuthRepository(get<ApiClientBase>()));

    get.registerSingleton<ShoppingsRepositoryBase>(
        ShoppingsListRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductAssignmentsRepositoryBase>(
        ProductAssignmentsRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductPurchasesRepositoryBase>(
        ProductPurchasesRepository(get<ApiClientBase>()));
    get.registerSingleton<TrasactionsRepositoryBase>(
        TrasactionsRepository(get<ApiClientBase>()));
    get.registerSingleton<GroupChatRepositoryBase>(
        GroupChatRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductsRepositoryBase>(
        ProductsRepository(get<ApiClientBase>()));
    get.registerSingleton<UsersRepositoryBase>(
        UsersRepository(get<ApiClientBase>()));

    // Controllers and services
    get.registerSingleton<SnackbarMessangerController>(
        SnackbarMessangerController());
    get.registerSingleton<FcmController>(FcmController(
      get<UsersRepositoryBase>(),
      get<InternetConnectivityService>(),
    ));
    get.registerSingleton<AuthController>(AuthController(
      get<ApiClientBase>(),
      get<AuthRepositoryBase>(),
      get<InternetConnectivityService>(),
      get<SnackbarMessangerController>(),
      get<FcmController>(),
    ));

    get.registerSingleton<ShoppingsListController>(
      ShoppingsListController(
          shoppingsListRepository: get<ShoppingsRepositoryBase>(),
          snackbarMessangerController: get<SnackbarMessangerController>()),
    );
    get.registerSingleton<ShoppingDetailController>(ShoppingDetailController(
      shoppingsListController: get<ShoppingsListController>(),
      trasactionsRepository: get<TrasactionsRepositoryBase>(),
      snackbarMessangerController: get<SnackbarMessangerController>(),
    ));
    get.registerSingleton<PurchasesController>(PurchasesController(
      get<ShoppingDetailController>(),
      get<SnackbarMessangerController>(),
      get<ProductAssignmentsRepositoryBase>(),
      get<ProductPurchasesRepositoryBase>(),
    ));
    get.registerSingleton<SinglePurchaseController>(SinglePurchaseController(
      get<AuthController>(),
      get<ProductPurchasesRepositoryBase>(),
      get<ProductAssignmentsRepositoryBase>(),
      get<SnackbarMessangerController>(),
    ));
    get.registerSingleton<AddProductAssignmentController>(
        AddProductAssignmentController(
      get<ShoppingDetailController>(),
      get<SnackbarMessangerController>(),
      get<ProductAssignmentsRepositoryBase>(),
      get<ProductsRepositoryBase>(),
    ));
    get.registerSingleton<ShoppingMembersController>(ShoppingMembersController(
      get<AuthController>(),
      get<ShoppingDetailController>(),
      get<UsersRepositoryBase>(),
      get<SnackbarMessangerController>(),
    ));

    get.registerSingleton<TokenValidationService>(TokenValidationService(
      authController: get<AuthController>(),
      apiClient: get<ApiClientBase>(),
      authRepository: get<AuthRepositoryBase>(),
    ));

    // Router
    get.registerSingleton<NavRouter>(NavRouter(
      singlePurchaseController: get<SinglePurchaseController>(),
      shoppingDetailController: get<ShoppingDetailController>(),
    ));
  }
}
