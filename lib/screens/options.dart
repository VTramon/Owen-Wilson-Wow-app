// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, unused_element, void_checks

import 'package:flutter/material.dart';
import 'package:owen_wilson/components/buttons/wow_button.dart';
import 'package:owen_wilson/components/wow_options_forms/random.dart';
import 'package:owen_wilson/models/options.dart';

class OptionScreen extends StatefulWidget {
  OptionsModel option = OptionsModel();
  Widget? selected;

  OptionScreen({Key? key, this.selected}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  // List<dynamic> selected = List.empty(growable: true);

  void _setSelectedButton(Widget value) async {
    setState(() {
      widget.selected = value;

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
                    onPressed: () => _setSelectedButton(RandomForm()),
                    title: 'Random',
                  ),
                  WowButton(
                    onPressed: null,
                    // onPressed: () => _setSelectedButton(RandomForm()),
                    title: 'By year',
                  ),
                  WowButton(
                    onPressed: null,
                    // onPressed: () => _setSelectedButton(RandomForm()),
                    title: 'By movie',
                  ),
                  WowButton(
                    onPressed: null,
                    // onPressed: () => _setSelectedButton(RandomForm()),
                    title: 'By director',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
            child: Center(child: widget.selected),
          )
        ],
      ),
    );
  }
}
