// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'images/wow.png',
              width: 95.0,
              height: 95.0,
              fit: BoxFit.cover,
            ),
            Text(
              'Owen\nWilson\nwows',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'RedRose',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 144,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(62.0),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('test'),
          )
        ],
      ),
    );
  }
}
