import 'package:flutter/material.dart';
import 'package:kolayca_teslimat/models/package_model.dart';

import '../routes.dart';

class PackagePage extends StatefulWidget {

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  Package? package;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
     setState(() {
       package = ModalRoute.of(context)!.settings.arguments as Package; //bir önceki safyada gönderdigimiz argumenta  erişiyoruz
     });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Detayı"),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: (){
          Navigator.of(context).popUntil((route) => route.isFirst);
          //   Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
          },
      ),
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
            Text("Paket ID : ${this.package?.id}",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text("Durum : ${this.package?.status}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("Tip : ${this.package?.typeName}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Text("Fiyatı : ${this.package?.price} TL",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Divider(),
            ),
            Text("Gönderen : ${this.package?.sender}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Text("Gönderen Adresi: ${this.package?.senderAddress}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Divider(),
            ),
            Text("Alıcı : ${this.package?.receiver}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            Text("Alıcı Adresi: ${this.package?.receiverAddress}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),




          ],
        ),
      ),
    );
  }
}
