

import 'package:get_it/get_it.dart';
import 'package:split_the_bill/common/api/authenticated_api_client.dart';
import 'package:split_the_bill/common/api/base_api_client.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/shoppings_list/repositories/mock_shoppings_repository.dart';
import 'package:split_the_bill/shoppings_list/repositories/shoppings_repository_base.dart';

final get = GetIt.instance;
abstract class IocContainer {
  static void setUpIoc() {
    get.registerSingleton<NavRouter>(NavRouter());
    get.registerSingleton<BaseApiClient>(AuthenticatedApiClient());

    get.registerSingleton<ShoppingsRepositoryBase>(MockShoppingsRepository());
  }
}