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
import 'package:split_the_bill/groupchat/controllers/groupchat_controller.dart';
import 'package:split_the_bill/groupchat/repositories/groupchat_repository.dart';
import 'package:split_the_bill/groupchat/repositories/groupchat_repository_base.dart';
import 'package:split_the_bill/home/controllers/last_visited_shopping_controller.dart';
import 'package:split_the_bill/home/controllers/statistics_controller.dart';
import 'package:split_the_bill/home/repositories/statistics_repository_base.dart';
import 'package:split_the_bill/products/repositories/products_repository.dart';
import 'package:split_the_bill/products/repositories/products_repository_base.dart';
import 'package:split_the_bill/profile_page/controllers/profile_controller.dart';
import 'package:split_the_bill/purchases/controllers/add_product_assignment_controller.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository.dart';
import 'package:split_the_bill/purchases/repositories/product_assignments/product_assignments_repository_base.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository.dart';
import 'package:split_the_bill/purchases/repositories/product_purchases/product_purchases_repository_base.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/user_filter_controller.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository.dart';
import 'package:split_the_bill/shopping_detail/repositories/transactions_repository_base.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_list_repository_base.dart';
import 'package:split_the_bill/common/services/internet_connectivity_service.dart';
import 'package:split_the_bill/user_chat/controllers/user_chat_controller.dart';
import 'package:split_the_bill/user_chat/repositories/user_chat_repository.dart';
import 'package:split_the_bill/user_chat/repositories/user_chat_repository_base.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/repositories/friendship_management_repository.dart';
import 'package:split_the_bill/users/repositories/friendship_management_repository_base.dart';
import 'package:split_the_bill/users/repositories/users_reposiory.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

import 'home/repositories/statistics_repository.dart';

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

    get.registerSingleton<ShoppingsListRepositoryBase>(
        ShoppingsListRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductAssignmentsRepositoryBase>(
        ProductAssignmentsRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductPurchasesRepositoryBase>(
        ProductPurchasesRepository(get<ApiClientBase>()));
    get.registerSingleton<TrasactionsRepositoryBase>(
        TrasactionsRepository(get<ApiClientBase>()));
    get.registerSingleton<GroupchatRepositoryBase>(
        GroupchatRepository(get<ApiClientBase>()));
    get.registerSingleton<ProductsRepositoryBase>(
        ProductsRepository(get<ApiClientBase>()));
    get.registerSingleton<UsersRepositoryBase>(
        UsersRepository(get<ApiClientBase>()));
    get.registerSingleton<FriendshipManagementRepositoryBase>(
        FriendshipManagementRepository(get<ApiClientBase>()));
    get.registerSingleton<UserChatRepositoryBase>(
        UserChatRepository(get<ApiClientBase>()));
    get.registerSingleton<StatisticsRepositoryBase>(
        StatisticsRepository(get<ApiClientBase>()));

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
        get<ShoppingsListRepositoryBase>(),
        get<SnackbarMessangerController>(),
        get<UsersRepositoryBase>(),
        get<ProductPurchasesRepositoryBase>(),
        get<ProductAssignmentsRepositoryBase>(),
      ),
    );
    get.registerSingleton<ShoppingDetailController>(ShoppingDetailController(
      get<ShoppingsListRepositoryBase>(),
      get<TrasactionsRepositoryBase>(),
      get<SnackbarMessangerController>(),
      get<ShoppingsListRepositoryBase>(),
      get<UsersRepositoryBase>(),
      get<ProductPurchasesRepositoryBase>(),
      get<ProductAssignmentsRepositoryBase>(),
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
      get<PurchasesController>(),
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
    get.registerSingleton<GroupchatController>(GroupchatController(
      get<ShoppingDetailController>(),
      get<ShoppingMembersController>(),
      get<GroupchatRepositoryBase>(),
      get<SnackbarMessangerController>(),
    ));
    get.registerSingleton<FriendsController>(FriendsController(
        get<AuthController>(),
        get<UsersRepositoryBase>(),
        get<FriendshipManagementRepositoryBase>(),
        get<SnackbarMessangerController>()));
    get.registerSingleton<UserChatController>(UserChatController(
      get<AuthController>(),
      get<UserChatRepositoryBase>(),
      get<SnackbarMessangerController>(),
      get<FriendsController>(),
    ));
    get.registerSingleton<UserFilterController>(UserFilterController());
    get.registerSingleton<ProfileController>(ProfileController(
        get<UsersRepositoryBase>(),
        get<AuthController>(),
        get<SnackbarMessangerController>()));
    get.registerSingleton<LastVisitedShoppingController>(
        LastVisitedShoppingController(
      get<AuthController>(),
      get<ShoppingDetailController>(),
      get<ShoppingsListRepositoryBase>(),
    ));
    get.registerSingleton<StatisticsController>(StatisticsController(
      get<AuthController>(),
      get<StatisticsRepositoryBase>(),
      get<ShoppingsListRepositoryBase>(),
    ));
    get.registerSingleton<TokenValidationService>(TokenValidationService(
      authController: get<AuthController>(),
      apiClient: get<ApiClientBase>(),
      authRepository: get<AuthRepositoryBase>(),
    ));

    // Router
    get.registerSingleton<NavRouter>(NavRouter(
      get<SinglePurchaseController>(),
      get<ShoppingDetailController>(),
      get<UserChatController>(),
    ));
  }
}
