import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kolayca_teslimat/network/auth_service.dart';
import 'package:kolayca_teslimat/store/auth_store.dart';
import 'package:kolayca_teslimat/pages/example_service.dart';
import 'package:kolayca_teslimat/store/package_store.dart';
import 'package:kolayca_teslimat/store/root_store.dart';
import 'package:kolayca_teslimat/pages/theme_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/package_service.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> init() async{
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => ExampleService());


  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //serviceLocater üzerinden kayedilen hizmetleri almak için get kullanıldı
  //dio sınıfı daha once registerLazy ile kaydedildiği için alttaki ifade Dio hizmetini bi örneğini döndürür
  //dipo değişkni de http istekleri yapar
  Dio dio = serviceLocator.get<Dio>();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler){
        if(sharedPreferences.containsKey("TOKEN")){
          options.headers.putIfAbsent("Authorization", () => "Bearer ${sharedPreferences.getString("TOKEN") ?? ""}");
        }
        return handler.next(options);
      },
    ),
  );


  serviceLocator.registerLazySingleton(() => AuthService(serviceLocator.get<Dio>()));
  serviceLocator.registerLazySingleton(() => PackageService(serviceLocator.get<Dio>()));



  serviceLocator.registerFactory(() => AuthStore());
  serviceLocator.registerFactory(() => ThemeStore());
  serviceLocator.registerFactory(() => PackageStore());


  serviceLocator.registerLazySingleton(() => RootStore(
      authStore: serviceLocator.get<AuthStore>(),
      themeStore: serviceLocator.get<ThemeStore>(),
      packageStore: serviceLocator.get<PackageStore>()));

}