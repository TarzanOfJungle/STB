import 'package:get_it/get_it.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/repositories/auth_repository.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_client.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';

final get = GetIt.instance;

abstract class IocContainer {
  static void setUpIoc() {
    get.registerSingleton<NavRouter>(NavRouter());
    get.registerSingleton<ApiClientBase>(ApiClient());

    // Repositories
    get.registerSingleton<AuthRepositoryBase>(
        AuthRepository(get<ApiClientBase>()));

    // Controllers
    get.registerSingleton<SnackbarMessangerController>(
        SnackbarMessangerController());
    get.registerSingleton<AuthController>(
      AuthController(
        client: get<ApiClientBase>(),
        authRepository: get<AuthRepositoryBase>(),
        snackbarMessangerController: get<SnackbarMessangerController>(),
      ),
    );
  }
}
