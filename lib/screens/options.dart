// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, unused_element, void_checks

import 'package:flutter/material.dart';
import 'package:owen_wilson/components/buttons/wow_button.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/models/options.dart';

class OptionScreen extends StatefulWidget {
  OptionsModel option = OptionsModel();
  final WowWebclient _wow = WowWebclient();

  OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  // List<dynamic> selected = List.empty(growable: true);
  String selected = '';

  void _setSelectedButton(String value) async {
    setState(() {
      selected = value;

      // debugPrint('selected: $selected');
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget._wow.oneRandom().then((value) => value.first.toString());
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
                    onPressed: () => _setSelectedButton('random'),
                    title: 'Random',
                  ),
                  WowButton(
                    onPressed: () => _setSelectedButton('year'),
                    title: 'By year',
                  ),
                  WowButton(
                    onPressed: () => _setSelectedButton('movie'),
                    title: 'By movie',
                  ),
                  WowButton(
                    onPressed: () => _setSelectedButton('director'),
                    title: 'By director',
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              selected.toString(),
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ],
      ),
    );
  }
}
