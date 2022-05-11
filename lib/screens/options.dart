// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, unused_element, void_checks

import 'package:flutter/material.dart';
import 'package:owen_wilson/components/buttons/wow_button.dart';
import 'package:owen_wilson/models/options.dart';

class OptionScreen extends StatefulWidget {
  OptionsModel option = OptionsModel();

  OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

// class _OptionScreenState extends State<OptionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

class _OptionScreenState extends State<OptionScreen> {
  late String selected;

  void setSelectedButton(String value) {
    setState(() {
      selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WOW',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 40.0,
              child: ListView(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                clipBehavior: Clip.hardEdge,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  WowButton(
                    title: 'Random',
                    // updateState: () => 'test',
                  ),
                  WowButton(
                    title: 'By year',
                    // updateState: setSelectedButton('year'),
                  ),
                  WowButton(
                    title: 'By movie',
                    // updateState: setSelectedButton('movie'),
                  ),
                  WowButton(
                    title: 'By director',
                    // updateState: setSelectedButton('director'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: widget.option.option != null
                ? Text(selected)
                : Text(
                    'null',
                    style: TextStyle(fontSize: 50.0),
                  ),
          ),
        ],
      ),
    );
  }
}
