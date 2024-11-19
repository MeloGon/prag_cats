import 'package:get_it/get_it.dart';
import 'package:pragma_cats/core/config/router/app_router.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(RouterCubit());
}
