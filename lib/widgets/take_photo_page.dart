import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhotoPage extends StatefulWidget {
  const TakePhotoPage({Key? key}) : super(key: key);

  @override
  State<TakePhotoPage> createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPage> {
  late CameraController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    () async {
      await Future.delayed(Duration.zero);

      List<CameraDescription> cameras = await availableCameras();

      controller = CameraController(cameras[0], ResolutionPreset.max);
      controller.initialize().then((value){
        if(!mounted){
          return;
        }
        setState(() {});
      }).catchError((Object e){
        if(e is CameraException){
          switch(e.code){
            case 'CameraAccessDenied':
            // Handle access errors here.
              break;
            default:
            // Handle other errors here.
              break;
          }
        }
      });

    }();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Center(
        child: CameraPreview(controller),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: (){
          controller.takePicture().then((XFile file) {
            print("done");
            print(file.path);
            
          }).onError((error, stackTrace) {
            print("error");
          });
        },
      ),
    );
  }
}
