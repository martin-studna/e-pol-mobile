import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PhoneCameraPageState extends State<PhoneCameraPage>
    with WidgetsBindingObserver {
  CameraController? controller;

  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      final firstCamera = cameras.first;
      // To display the current output from the Camera,
      // create a CameraController.
      controller = CameraController(
        // Get a specific camera from the list of available cameras.
        firstCamera,
        // Define the resolution to use.
        ResolutionPreset.medium,
      );

      controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || controller!.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }
}

class PhoneCameraPage extends StatefulWidget {
  @override
  PhoneCameraPageState createState() => PhoneCameraPageState();
}
