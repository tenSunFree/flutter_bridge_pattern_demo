import 'package:flutter/material.dart';
import 'file:///C:/FlutterBridgePatternDemo/flutter_bridge_pattern_demo/lib/view/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: HomeScreen());
  }
}
