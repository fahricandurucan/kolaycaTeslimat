import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolayca_teslimat/pages/auth_store.dart';
import 'package:kolayca_teslimat/pages/home_page.dart';
import 'package:kolayca_teslimat/pages/root_store.dart';
import 'package:kolayca_teslimat/pages/theme_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kolayca_teslimat/injector.dart' as injector;


import '../routes.dart';
import 'example_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ExampleService _exampleService = injector.serviceLocator.get<ExampleService>();

  late RootStore _rootStore;
  late AuthStore _authStore;
  late ThemeStore _themeStore;


  final TextEditingController _phoneNumberController = new TextEditingController();

  bool loginIsStarted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
      _phoneNumberController.text = sharedPreferences.getString('phoneNumber') ?? '';
    });  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _rootStore = Provider.of<RootStore>(context);
    _authStore = _rootStore.authStore;
    _themeStore = _rootStore.themeStore;

  }


  void attemptLogin() {
    if (_phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen telefon numaranızı giriniz.'),
        ),
      );
    } else {
      startLogin();
    }
  }

  void startLogin() {
    _authStore.login(_phoneNumberController.text);

    if(_authStore.isLoginIn == true){
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bilgileriniz Hatali.'),
        ),
      );
    }
  }


  // void startFakeRequest() {
  //   setState(() {
  //     loginIsStarted = true;
  //   });
  //
  //   Future.delayed(Duration(seconds: 2), () {
  //     setState(() {
  //       loginIsStarted = false;
  //     });
  //
  //     SharedPreferences.getInstance().then((SharedPreferences sharedPreferences) {
  //       sharedPreferences.setString('phoneNumber', _phoneNumberController.text);
  //     });
  //
  //
  //     if (_phoneNumberController.text == '123456') {
  //       Navigator.of(context).pushReplacementNamed(Routes.home);
  //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Bilgileriniz Hatali.'),
  //         ),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Observer(builder:(context){
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "Hero",
              child: Icon(Icons.local_shipping,size:100,color: Colors.brown,),
            ),
            buildPhoneNumber(),
            buildLoginButton()
          ],
        ),
      );
    });
  }

  Widget buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: loginIsStarted == true
          ? SizedBox(
        width: 50,
        height: 50,
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      )
          : SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            attemptLogin();
          },
          child: Text('Giriş Yap'),
        ),
      ),
    );
  }

  Widget buildPhoneNumber() {
    return Observer(builder: (context){
      return  Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: new TextField(
          controller: _phoneNumberController,
          decoration: new InputDecoration(
            hintText: 'Telefon Numaranız',
            icon: new Icon(Icons.person),
          ),
        ),
      );
    });
  }

}