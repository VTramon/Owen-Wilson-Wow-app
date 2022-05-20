// ignore_for_file: prefer_const_constructors, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owen_wilson/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 230, 150, 0)));
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 230, 150, 0)),
            ),
          ),
          fontFamily: 'Nunito',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'RedRose',
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
            ),
            button: TextStyle(
              fontFamily: 'RedRose',
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
            ),
            bodyText1: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            bodyText2: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
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
