import 'package:entertainmentapp/views/launcher.dart';
import 'package:entertainmentapp/views/walkthrough.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entertainment App',
      navigatorKey: this.navigatorKey,
      routes: {
        'launcher': (context) => Launcher(),
        'walkthrough': (context) => Walkthrough(),
      },
      home: Walkthrough(),
    );
  }
}
