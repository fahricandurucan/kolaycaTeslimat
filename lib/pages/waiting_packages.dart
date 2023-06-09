import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolayca_teslimat/pages/package_page.dart';
import 'package:kolayca_teslimat/store/package_store.dart';
import 'package:kolayca_teslimat/store/root_store.dart';
import 'package:provider/provider.dart';
import '../models/package_model.dart';
import '../routes.dart';

class WaitingPackagesPage extends StatefulWidget {
  @override
  _WaitingPackagesPageState createState() => _WaitingPackagesPageState();
}

class _WaitingPackagesPageState extends State<WaitingPackagesPage> {
  late RootStore rootStore;
  late PackageStore packageStore;

  int crossaxisCount = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await Future.delayed(Duration.zero);
      await packageStore.fetchPackages();
    }();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    rootStore = Provider.of<RootStore>(context);
    packageStore = rootStore.packageStore;
  }


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
    return Observer(builder: (context) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: GridView.count(
          crossAxisCount: crossaxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          childAspectRatio: crossaxisCount > 1 ? 1 : 16 / 9,
          children: packageStore.packages.map((package) {
            return buildPack(package);
          }).toList(),
        ),
      );
    });
  }

  Widget buildPack(PackageModel package){
    return GestureDetector(
      onTap: (){
        packageStore.choosePackage(package);
        Navigator.of(context).pushNamed(Routes.package);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => PackagePage(package: package)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Paket ID: ${package.id}"),
            Text("Tip: ${package.typeName}"),
            Text("Fiyat: ${package.price} TL"),
            Text("Durum: ${package.status}"),
          ],
        ),
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