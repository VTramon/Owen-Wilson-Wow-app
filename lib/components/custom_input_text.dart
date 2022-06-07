import 'package:flutter/material.dart';

class CustomInputText extends StatefulWidget {
  final List<String> list;
  final String title;
  final void Function(String)? onSelect;
  // late String? movie;
  const CustomInputText(
      {Key? key, required this.list, required this.title, this.onSelect})
      : super(key: key);

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Text(
            widget.title,
            style: const TextStyle(
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
              border: Border.all(width: 1.0, color: Colors.black38),
            ),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return widget.list.where((String item) {
                  return item.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: widget.onSelect,
            ),
          ),
        ),
      ],
    );
  }
}
