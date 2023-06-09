import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kolayca_teslimat/models/package_model.dart';
import 'package:kolayca_teslimat/store/auth_store.dart';
import 'package:kolayca_teslimat/store/package_store.dart';
import 'package:kolayca_teslimat/store/root_store.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import '../widgets/take_photo_page.dart';

class PackagePage extends StatefulWidget {

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {

  late RootStore rootStore;
  late AuthStore authStore;
  late PackageStore packageStore;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    rootStore = Provider.of<RootStore>(context);
    authStore = rootStore.authStore;
    packageStore = rootStore.packageStore;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Detayı"),
      ),
      body: buildBody(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.home),
      //   onPressed: (){
      //     Navigator.of(context).popUntil((route) => route.isFirst);
      //     //   Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
      //     },
      // ),
    );
  }

  Widget buildBody() {
    return Observer(builder: (context) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBasicInfo(),
              buildReceiverInfo(),
              buildSenderInfo(),
              buildMoveToCar(),
              buildComplete(),
            ],
          ),
        ),
      );
    });
  }

  Widget buildBasicInfo() {
    return Observer(builder: (context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  packageStore.package?.status ?? '',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '#' + (packageStore.package?.id.toString() ?? ''),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Text(
              packageStore.package?.typeName ?? '',
              style: TextStyle(fontSize: 16),
            ),
            Text('₺' + (packageStore.package?.price.toString() ?? '')),
          ],
        ),
      );
    });
  }

  Widget buildReceiverInfo() {
    return Observer(builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alıcı',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              (packageStore.package?.receiver.firstName ?? '') + ' ' + (packageStore.package?.receiver.lastName ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (packageStore.package?.receiver.phoneNumber ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "${packageStore.package?.receiver.address}, ${packageStore.package?.receiver.district}, ${packageStore.package?.receiver.city}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (packageStore.package?.receiver.postalCode ?? ''),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }

  Widget buildSenderInfo() {
    return Observer(builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gönderici',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              (packageStore.package?.sender.firstName ?? '') + ' ' + (packageStore.package?.sender.lastName ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (packageStore.package?.sender.phoneNumber ?? ''),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "${packageStore.package?.sender.address}, ${packageStore.package?.sender.district}, ${packageStore.package?.sender.city}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (packageStore.package?.sender.postalCode ?? ''),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }

  Widget buildMoveToCar() {
    return Observer(builder: (BuildContext context) {
      if (packageStore.package?.status == 'Bekleniyor' &&
          (packageStore.package?.responsibleUserId == null || packageStore.package?.responsibleUserId == authStore.user?.id)) {
        return Container(
          child: ElevatedButton(
            child: Text('Araca Taşı'),
            onPressed: () async {
              await packageStore.moveToCar();
            },
          ),
        );
      }

      return SizedBox.shrink();
    });
  }

  Widget buildComplete() {
    return Observer(builder: (BuildContext context) {
      if (packageStore.package?.status == 'Araçta' && packageStore.package?.responsibleUserId == authStore.user?.id) {
        return Container(
          child: ElevatedButton(
            child: Text('Teslim Et'),
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => TakePhotoPage(),
                ),
              );
            },
          ),
        );
      }

      return SizedBox.shrink();
    });
  }
}
