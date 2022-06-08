import 'package:flutter/material.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/components/custom_input_text.dart';
import 'package:owen_wilson/components/random_input_text.dart';
import 'package:owen_wilson/screens/wow.dart';

class ByDirector extends StatefulWidget {
  final TextEditingController? resultLength = TextEditingController();
  String? director;
  ByDirector({Key? key, this.director}) : super(key: key);

  @override
  State<ByDirector> createState() => _ByDirectorState();
}

class _ByDirectorState extends State<ByDirector> {
  static final List<String> _diretors = [
    "Wes Anderson",
    "Jan de Bont",
    "Alan Rudolph",
    "Tom Dey",
    "Jay Roach",
    "Ben Stiller",
    "Betty Thomas",
    "David Dobkin",
    "George Armitage",
    "Todd Phillips",
    "John Lasseter",
    "Joe Russo and Anthony Russo",
    "Steven Brill",
    "David Frankel",
    "Paul Weitz",
    "Peter Farrelly and Bobby Farrelly",
    "Woody Allen",
    "Shawn Levy",
    "Jimmy Hayward",
    "Matthew Weiner",
    "John Erick Dowdle",
    "Brian Fee",
    "Lawrence Sher"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputText(
            list: _diretors,
            title: 'Director',
            onSelect: (String value) {
              widget.director = value;
            }),
        RandomWowInputText(
          maxLength: 1,
          text: widget.resultLength,
        ),
        ScreenButtonComponent(
          onPressed: () async {
            if (widget.resultLength!.text.isNotEmpty) {
              push(
                  context,
                  WowContainer(
                    resultsLength: widget.resultLength!.text,
                    director: widget.director,
                    content: 'byDirector',
                  ));
            } else {
              push(
                  context,
                  WowContainer(
                      director: widget.director, content: 'byDirector'));
            }
          },
          title: 'By director',
        )
      ],
    );
  }
}
