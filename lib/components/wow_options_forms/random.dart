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

  // Future<List<dynamic>> setData() async {
  //   final response = await wow.random();

  //   List apiData = response;
  //   return apiData;
  //   // widget.apiData = response.first;
  //   // return response.first;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          maxLength: 1,
          keyboardType: TextInputType.number,
          controller: widget.text,
        ),
        ScreenButtonComponent(
          onPressed: () async {
            // wow.random();
            // debugPrint(widget.text?.text);
            if (widget.text!.text.isNotEmpty) {
              // WowWebclient().random(resultsLength: widget.text!.text);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) =>
                      WowScreen(resultsLength: widget.text!.text)));
            }
          },
          title: 'Random',
        )
      ],
    );
  }
}
