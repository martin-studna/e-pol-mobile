import 'package:flutter/material.dart';
import 'package:namer_app/PrimaryButton.dart';

class StartToCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start to count'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(text: "Phone cam"),
          PrimaryButton(text: "IP cam"),
        ]),
      ),
    );
  }
}
