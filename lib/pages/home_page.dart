import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolayca_teslimat/store/package_store.dart';
import 'package:kolayca_teslimat/store/root_store.dart';
import 'package:provider/provider.dart';

import '../widgets/my_custom_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RootStore rootStore;
  late PackageStore packageStore;

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Set<Marker> markers = {};

  CameraPosition kgooglePlex = CameraPosition(
      target: LatLng(37.214994, 28.363613),
      zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      await packageStore.fetchPackages();
      bindMarkers();
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    rootStore = Provider.of<RootStore>(context);
    packageStore = rootStore.packageStore;
  }

  void bindMarkers() {
    setState(() {
      markers = packageStore.packages.map((package) {
        return Marker(
          markerId: MarkerId(package.id.toString()),
          position: LatLng(package.position.latitude, package.position.longitude),
          infoWindow: InfoWindow(
            title: package.id.toString(),
            snippet: package.receiver.address,
          ),
        );
      }).toSet();
    });

    print(markers.length);
  }


  int myCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kolayca Teslimat'),
      ),
      drawer: MyCustomDrawer(),
      // body: buildBody(),
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: kgooglePlex,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        markers:  markers,
      ),
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