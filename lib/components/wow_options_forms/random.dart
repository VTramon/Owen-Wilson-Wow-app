import 'package:flutter/material.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/screens/wow.dart';

class RandomForm extends StatefulWidget {
  final TextEditingController? text = TextEditingController();
  RandomForm({Key? key}) : super(key: key);

  @override
  State<RandomForm> createState() => _RandomFormState();
}

class _RandomFormState extends State<RandomForm> {
  final WowWebclient wow = WowWebclient();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '1',
          ),
          maxLength: 1,
          keyboardType: TextInputType.number,
          controller: widget.text,
        ),
        ScreenButtonComponent(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
              if (widget.text!.text.isNotEmpty) {
                return WowScreen(resultsLength: widget.text!.text);
              }
              return const WowScreen();
            }));
          },
          title: 'Random',
        )
      ],
    );
  }
}
