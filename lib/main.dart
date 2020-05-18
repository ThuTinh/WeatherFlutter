import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './screens/home.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      canvasColor: Colors.white,
        scaffoldBackgroundColor: Hexcolor("#4FC3F7"),
        primaryColor: Hexcolor("#01579B"),
        primaryIconTheme: IconThemeData(color: Colors.white),
      ),
      home: HomeScreen(),
    );
  }
}
