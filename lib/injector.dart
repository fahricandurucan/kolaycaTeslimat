import 'package:get_it/get_it.dart';
import 'package:kolayca_teslimat/pages/auth_store.dart';
import 'package:kolayca_teslimat/pages/example_service.dart';
import 'package:kolayca_teslimat/pages/package_store.dart';
import 'package:kolayca_teslimat/pages/root_store.dart';
import 'package:kolayca_teslimat/pages/theme_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> init() async{
  serviceLocator.registerLazySingleton(() => ExampleService());

  serviceLocator.registerFactory(() => AuthStore());
  serviceLocator.registerFactory(() => ThemeStore());
  serviceLocator.registerFactory(() => PackageStore());


  serviceLocator.registerLazySingleton(() => RootStore(
      authStore: serviceLocator.get<AuthStore>(),
      themeStore: serviceLocator.get<ThemeStore>(),
      packageStore: serviceLocator.get<PackageStore>()));

}