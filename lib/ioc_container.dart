import 'package:get_it/get_it.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/repositories/auth_repository.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_client.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/shoppings_list/repositories/mock_shoppings_repository.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_repository_base.dart';

final get = GetIt.instance;

abstract class IocContainer {
  static void setUpIoc() {
    get.registerSingleton<NavRouter>(NavRouter());
    get.registerSingleton<ApiClientBase>(ApiClient());

    // Repositories
    get.registerSingleton<AuthRepositoryBase>(
        AuthRepository(get<ApiClientBase>()));
    get.registerSingleton<ShoppingsRepositoryBase>(MockShoppingsRepository());


    // Controllers
    get.registerSingleton<AuthController>(
      AuthController(
          client: get<ApiClientBase>(),
          authRepository: get<AuthRepositoryBase>()),
    );
  }
}
