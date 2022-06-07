import 'package:flutter/material.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/components/custom_input_text.dart';
import 'package:owen_wilson/components/random_input_text.dart';
import 'package:owen_wilson/screens/wow.dart';

class ByYear extends StatefulWidget {
  final TextEditingController? resultLength = TextEditingController();
  String? year;
  ByYear({Key? key, this.year}) : super(key: key);

  @override
  State<ByYear> createState() => _ByYearState();
}

class _ByYearState extends State<ByYear> {
  static final List<String> _year = [
    '1996',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2010',
    '2011',
    '2013',
    '2014',
    '2015',
    '2017'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputText(
            list: _year,
            title: 'Year',
            onSelect: (String value) {
              widget.year = value;
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
                    year: widget.year,
                    content: 'byYear',
                  ));
            } else {
              push(context, WowContainer(year: widget.year, content: 'byYear'));
            }
          },
          title: 'By year',
        )
      ],
    );
  }
}

// class ByYear extends StatefulWidget {
//   final TextEditingController? resultLength = TextEditingController();
//   final TextEditingController? year = TextEditingController();
//   ByYear({Key? key}) : super(key: key);

//   @override
//   State<ByYear> createState() => _ByYearState();
// }

// class _ByYearState extends State<ByYear> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> years = [
//     ];
//     return Column(
//       children: [
//         Input(text: widget.year),
//         Input(maxLength: 1, text: widget.resultLength),
//         ScreenButtonComponent(
//           onPressed: () async {
//             if (widget.resultLength!.text.isNotEmpty) {
//               push(context,
//                   WowContainer(resultsLength: widget.resultLength!.text));
//             } else {
//               push(context, const WowContainer());
//             }
//           },
//           title: 'Random',
//         )
//       ],
//     );
//   }
// }

// class Input extends StatelessWidget {
//   final TextEditingController? text;
//   final int? maxLength;
//   const Input({Key? key, required this.text, this.maxLength}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: '1',
//       ),
//       maxLength: maxLength,
//       keyboardType: TextInputType.number,
//       controller: text,
//     );
//   }
// }
