import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/PrimaryButton.dart';
import 'package:namer_app/dashboard_page.dart';
import 'package:namer_app/start_to_count_page.dart';
import 'package:namer_app/subscription_page.dart';
import 'package:namer_app/settings_page.dart';
import 'package:namer_app/contactus_page.dart';
import 'package:provider/provider.dart';

import 'stop_to_count_page copy.dart';

void main() {
  runApp(MyApp());
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
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                    text: "Start to count",
                    press: () {
                      appState.current = WordPair.random();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartToCountPage()));
                    }),
                PrimaryButton(
                    text: "Stop to count",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StopToCountPage()));
                    }),
              ],
            ),
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
