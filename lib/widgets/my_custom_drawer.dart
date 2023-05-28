import 'package:flutter/material.dart';
import 'package:kolayca_teslimat/pages/login_page.dart';
import 'package:kolayca_teslimat/pages/waiting_packages.dart';

class MyCustomDrawer extends StatefulWidget {
  const MyCustomDrawer({Key? key}) : super(key: key);

  @override
  State<MyCustomDrawer> createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Kolayca Teslimat'),
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
          ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WaitingPackagesPage()));
            },
          ),
          ListTile(
            title: Text('Cikis Yap'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
