import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/primary_button.dart';
import 'package:namer_app/dashboard_page.dart';
import 'package:namer_app/camera_page.dart';
import 'package:namer_app/subscription_page.dart';
import 'package:namer_app/settings_page.dart';
import 'package:namer_app/contactus_page.dart';
import 'package:provider/provider.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  runApp(MyApp(
      // Pass the appropriate camera to the CameraPage widget.

      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                text: "Camera",
                height: 50,
                width: 300,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CameraPage()));
                }),
            PrimaryButton(
                text: "Dashboard",
                height: 150,
                width: 300,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardPage()));
                }),
            PrimaryButton(
                text: "Subscription",
                height: 50,
                width: 300,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubscriptionPage()));
                }),
            PrimaryButton(
                text: "Settings",
                height: 50,
                width: 300,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                }),
            PrimaryButton(
              text: "Contact us",
              height: 50,
              width: 300,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
