// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String? content;
  final List<TextSpan>? children;
  const TextCard({Key? key, this.content, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 250, 225, 189),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text.rich(
          TextSpan(
            text: content,
            children: children,
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
