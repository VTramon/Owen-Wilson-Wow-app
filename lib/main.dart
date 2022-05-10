// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:owen_wilson/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromARGB(255, 230, 150, 0),
              onPrimary: Colors.white,
              secondary: Color.fromARGB(255, 255, 193, 85),
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              background: Color.fromARGB(255, 243, 243, 243),
              onBackground: Colors.black,
              surface: Color.fromARGB(255, 255, 236, 207),
              onSurface: Colors.black)),
      home: HomePage(),
    );
  }
}
