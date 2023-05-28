import 'package:flutter/material.dart';
import 'package:kolayca_teslimat/models/package_model.dart';

class PackagePage extends StatefulWidget {
  Package package;

  PackagePage({required this.package});





  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Detayı"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Paket ID : ${widget.package.id}",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
