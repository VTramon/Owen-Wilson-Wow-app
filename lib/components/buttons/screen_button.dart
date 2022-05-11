// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';

class ScreenButtonComponent extends StatelessWidget {
  final String title;
  final Widget onPressed;
  const ScreenButtonComponent(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

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
          onPressed: () async {
            final pop = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => onPressed,
              ),
            );
            if (pop == true) {
              setState() {}
            }
          },
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
