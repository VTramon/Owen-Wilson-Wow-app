import 'package:flutter/material.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/components/random_input_text.dart';
import 'package:owen_wilson/screens/wow.dart';

class RandomForm extends StatefulWidget {
  final TextEditingController? text = TextEditingController();
  RandomForm({Key? key}) : super(key: key);

  @override
  State<RandomForm> createState() => _RandomFormState();
}

class _RandomFormState extends State<RandomForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RandomWowInputText(maxLength: 1, text: widget.text),
        ScreenButtonComponent(
          onPressed: () async {
            if (widget.text!.text.isNotEmpty) {
              push(context, WowContainer(resultsLength: widget.text!.text));
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
