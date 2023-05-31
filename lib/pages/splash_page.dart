import 'package:flutter/material.dart';
import 'package:kolayca_teslimat/pages/home_page.dart';
import 'package:kolayca_teslimat/pages/login_page.dart';
import 'package:kolayca_teslimat/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacementNamed(Routes.login);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
