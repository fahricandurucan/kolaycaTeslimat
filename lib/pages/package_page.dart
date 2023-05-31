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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text("Paket ID : ${widget.package.id}",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text("Durum : ${widget.package.status}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("Tip : ${widget.package.typeName}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Text("Fiyatı : ${widget.package.price} TL",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Divider(),
            ),
            Text("Gönderen : ${widget.package.sender}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Text("Gönderen Adresi: ${widget.package.senderAddress}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Divider(),
            ),
            Text("Alıcı : ${widget.package.receiver}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Text("Alıcı Adresi: ${widget.package.receiverAddress}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),




          ],
        ),
      ),
    );
  }
}
