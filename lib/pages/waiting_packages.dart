import 'package:flutter/material.dart';
import '../models/package_model.dart';

class WaitingPackagesPage extends StatefulWidget {
  @override
  _WaitingPackagesPageState createState() => _WaitingPackagesPageState();
}

class _WaitingPackagesPageState extends State<WaitingPackagesPage> {
  // List<int> packages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  List<Package> packages = [
    Package(id:"23132",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"5132",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"453132",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"21702",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"23168",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"23682",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"23642",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
    Package(id:"23478",typeName: "Standart Gönderim", price: 15.50, description: "wefwf",
      sender: 'Amazon', receiver: 'Fahrican Durucan +905364443232', status: 'Depoda', receiverAddress: '', senderAddress: '',),
  ];

  int crossaxisCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bekleyen Paketler'),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  crossaxisCount = crossaxisCount == 1 ? 2 : 1;
                });
              },
              icon: Icon(crossaxisCount==1 ? Icons.grid_view_sharp : Icons.list),
          ),
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.near_me),
        onPressed: () {
          //
        },
      ),
    );
  }

  // Widget buildBody() {
  //   return Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: packages.map((packageNumber) {
  //           return buildPack(packageNumber);
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }

  Widget buildBody() {
    return GestureDetector(
      onTap: (){
        print("lwşfkwlşef");
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: GridView.count(
          crossAxisCount: crossaxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          childAspectRatio: crossaxisCount > 1 ? 1 : 16 / 9,
          children: packages.map((package) {
            return buildPack(package);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildPack(Package package){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${package.id}"),
          Text("${package.typeName}"),
          Text("${package.price} TL"),
        ],
      ),
    );
  }

  // Widget buildPack(int packageNumber) {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.only(left: 20, right: 20, top: 20),
  //     padding: EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.grey,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     // child: Text('Paket ' + packageNumber.toString()),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Standart Paket',
  //               style: TextStyle(
  //                 fontSize: 18,
  //               ),
  //             ),
  //             Text('15 TL'),
  //           ],
  //         ),
  //         SizedBox(height: 20),
  //         //
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Gönderici',
  //             ),
  //             Text('Alıcı'),
  //           ],
  //         ),
  //         SizedBox(height: 5),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Ahmet',
  //             ),
  //             Text('Ayşe'),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}