import 'package:flutter/material.dart';

import '../widgets/my_custom_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kolayca Teslimat'),
      ),
      drawer: MyCustomDrawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Center(
        child: Column(
          children: [
            Hero(
                tag: "Hero",
                child: Icon(Icons.local_shipping,size: 150,color:Colors.brown)
            ),
          ],
        ),
      ),
    );
  }

}