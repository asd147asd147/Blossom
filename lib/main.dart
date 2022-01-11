import 'package:flutter/material.dart';
import './homePage.dart';
import './theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JuneBank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: BankTheme.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

