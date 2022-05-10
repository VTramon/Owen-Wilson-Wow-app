// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  const ButtonComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minWidth: 81.0, minHeight: 32.0, maxHeight: 32.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: null,
          child: Text(
            title,
            style: Theme.of(context).textTheme.button,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
