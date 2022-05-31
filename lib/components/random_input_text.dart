import 'package:flutter/material.dart';

class RandomWowInputText extends StatelessWidget {
  final TextEditingController? text;
  final int? maxLength;
  const RandomWowInputText({Key? key, required this.text, this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.maxFinite,
          child: Text(
            'How many WOW do you want?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '1',
          ),
          maxLength: maxLength,
          keyboardType: TextInputType.number,
          controller: text,
        ),
      ],
    );
  }
}
