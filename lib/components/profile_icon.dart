// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:owen_wilson/firebase/authentication.dart';
import 'package:owen_wilson/models/logged_user.dart';
import 'package:provider/provider.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedMenu = '';

    return Consumer<LoggedUser>(
        builder: ((context, value, child) => PopupMenuButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(value.photoUrl.toString()),
                ),
              ),
              onSelected: (item) {
                Authentication.signOut();
                LoggedUser().signOut();
                Navigator.of(context).pushNamed('/signIn');
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  child: Text('Logout'),
                  value: 'value',
                ),
              ],
            )));
  }
}
