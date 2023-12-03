import 'package:flutter/material.dart';
import 'package:namer_app/phone_camera_page.dart';
import 'package:namer_app/primary_button.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
              text: "Phone cam",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneCameraPage()));
              }),
          PrimaryButton(text: "IP cam"),
        ]),
      ),
    );
  }
}
