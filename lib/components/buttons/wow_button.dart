// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:owen_wilson/models/options.dart';

class WowButton extends StatefulWidget {
  final String title;
  final void Function()? onPressed;
  final bool? selected;
  OptionsModel? option = OptionsModel();

  WowButton({
    Key? key,
    this.option,
    required this.title,
    this.onPressed,
    this.selected,
  }) : super(key: key);

  @override
  State<WowButton> createState() => _WowButtonState();
}

class _WowButtonState extends State<WowButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: 81.0, minHeight: 32.0, maxHeight: 32.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
