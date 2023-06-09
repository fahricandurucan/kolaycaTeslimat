import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolayca_teslimat/store/auth_store.dart';
import 'package:kolayca_teslimat/pages/login_page.dart';
import 'package:kolayca_teslimat/store/root_store.dart';
import 'package:kolayca_teslimat/pages/theme_store.dart';
import 'package:kolayca_teslimat/pages/waiting_packages.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class MyCustomDrawer extends StatefulWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  State<MyCustomDrawer> createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {

  late RootStore _rootStore;
  late AuthStore _authStore;
  late ThemeStore _themeStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _rootStore = Provider.of<RootStore>(context);
    _authStore = _rootStore.authStore;
    _themeStore = _rootStore.themeStore;
  }


  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Drawer(
        child: ListView(
          children: [
            Observer(builder: (context) {
              return DrawerHeader(
                child: Column(
                  children: [
                    Text("${_authStore.user?.firstName ?? ""} ${_authStore.user?.lastName ?? ""}",
                    style: TextStyle(fontSize: 24),),
                    Text("Kazancın: ₺ ${_authStore.user?.balanceAmount ?? ""}")
                  ],
                ),
                decoration: BoxDecoration(
                  color: _themeStore.primaryColor,
                ),
              );
            }),
            ListTile(
              title: Text('Rota Haritasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            ListTile(
              title: Text('Bekleyen Paketler'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(Routes.waitingPackages);
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WaitingPackagesPage()));
              },
            ),
            ListTile(
              title: Text('Cikis Yap'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed(Routes.login);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      );
    });
  }
}
