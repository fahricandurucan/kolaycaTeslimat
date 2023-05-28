import 'package:flutter/material.dart';
import 'package:kolayca_teslimat/models/package_model.dart';
import 'package:kolayca_teslimat/pages/home_page.dart';
import 'package:kolayca_teslimat/pages/package_page.dart';
import 'package:kolayca_teslimat/pages/splash_page.dart';
import 'package:kolayca_teslimat/pages/waiting_packages.dart';
// import 'package:kolaycateslimat/pages/home_page.dart';
// import 'package:kolaycateslimat/pages/login_page.dart';
// import 'package:kolaycateslimat/pages/waiting_packages_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashPage()
    );
  }
}