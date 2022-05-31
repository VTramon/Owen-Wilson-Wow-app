import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/components/random_input_text.dart';
import 'package:owen_wilson/screens/wow.dart';

class ByMovie extends StatefulWidget {
  final TextEditingController? resultLength = TextEditingController();
  final TextEditingController? movie = TextEditingController();
  ByMovie({Key? key}) : super(key: key);

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
        const SizedBox(
          width: double.maxFinite,
          child: Text(
            'Movie',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.0, color: Colors.black38)),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return _movies.where((String item) {
                  return item.contains(textEditingValue.text.toLowerCase());
                });
              },
            ),
          ),
        ),
        RandomWowInputText(maxLength: 1, text: widget.resultLength),
        ScreenButtonComponent(
          onPressed: () async {
            if (widget.resultLength!.text.isNotEmpty) {
              push(context,
                  WowContainer(resultsLength: widget.resultLength!.text));
            } else {
              push(context, const WowContainer());
            }
          },
          title: 'Random',
        )
      ],
    );
  }
}
