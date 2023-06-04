import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolayca_teslimat/models/package_model.dart';
import 'package:kolayca_teslimat/pages/home_page.dart';
import 'package:kolayca_teslimat/pages/package_page.dart';
import 'package:kolayca_teslimat/pages/root_store.dart';
import 'package:kolayca_teslimat/pages/splash_page.dart';
import 'package:kolayca_teslimat/pages/waiting_packages.dart';
import 'package:kolayca_teslimat/routes.dart';
import 'package:kolayca_teslimat/injector.dart' as injector;
import 'package:provider/provider.dart';


// import 'package:kolaycateslimat/pages/home_page.dart';
// import 'package:kolaycateslimat/pages/login_page.dart';
// import 'package:kolaycateslimat/pages/waiting_packages_page.dart';

main() async {
  await injector.init();
  runApp(MultiProvider(
      providers: [
        Provider.value(value: injector.serviceLocator.get<RootStore>()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder:(context){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: SplashPage(),
        onGenerateRoute: Routes().onGenerateRoute,
      );
    });
  }
}