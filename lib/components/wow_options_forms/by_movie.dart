import 'package:flutter/material.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/components/custom_input_text.dart';
import 'package:owen_wilson/components/random_input_text.dart';
import 'package:owen_wilson/screens/wow.dart';

class ByMovie extends StatefulWidget {
  final TextEditingController? resultLength = TextEditingController();
  // final TextEditingController? movie = TextEditingController();
  String? movie;
  ByMovie({Key? key, this.movie}) : super(key: key);

  @override
  State<ByMovie> createState() => _ByMovieState();
}

class _ByMovieState extends State<ByMovie> {
  static final List<String> _movies = [
    "Bottle Rocket",
    "The Haunting",
    "Breakfast of Champions",
    "Shanghai Noon",
    "Meet the Parents",
    "Zoolander",
    "I Spy",
    "Shanghai Knights",
    "The Big Bounce",
    "Starsky & Hutch",
    "Wedding Crashers",
    "Cars",
    "You, Me and Dupree",
    "The Darjeeling Limited",
    "Drillbit Taylor",
    "Marley & Me",
    "Marmaduke",
    "Little Fockers",
    "Hall Pass",
    "Midnight in Paris",
    "Cars 2",
    "The Big Year",
    "The Internship",
    "Free Birds",
    "Are You Here",
    "Night at the Museum: Secret of the Tomb",
    "No Escape",
    "Cars 3",
    "Father Figures"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputText(
            list: _movies,
            title: 'Movie',
            onSelect: (String value) {
              widget.movie = value;
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
                    movie: widget.movie,
                    content: 'byMovie',
                  ));
            } else {
              push(context,
                  WowContainer(movie: widget.movie, content: 'byMovie'));
            }
          },
          title: 'by Movie',
        )
      ],
    );
  }
}
