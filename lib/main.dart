import 'package:banking_dev_app/Screens/ScreenOption.dart';
import 'package:banking_dev_app/Screens/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'dashboard',
      theme:ThemeData(
        primarySwatch:Colors.green,
      ),
      home:ScreenHome(),
      routes: {
      'nextScreen': (context) {
        return ScreenOption();
      },
    },
    );
  }
}




