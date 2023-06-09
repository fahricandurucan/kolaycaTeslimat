import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolayca_teslimat/pages/splash_page.dart';
import 'package:kolayca_teslimat/routes.dart';
import 'package:kolayca_teslimat/store/root_store.dart';
import 'package:kolayca_teslimat/injector.dart' as injector;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injector.init();

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: injector.serviceLocator.get<RootStore>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: injector.serviceLocator.get<RootStore>().themeStore.primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: injector.serviceLocator.get<RootStore>().themeStore.primaryColor,
          ),
        ),
        home: const SplashPage(),
        onGenerateRoute: Routes().onGenerateRoute,
      );
    });
  }
}