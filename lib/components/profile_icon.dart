import 'package:flutter/material.dart';
import 'package:owen_wilson/firebase/authentication.dart';
import 'package:owen_wilson/models/logged_user.dart';
import 'package:provider/provider.dart';

class ProfileIcon extends StatelessWidget {
  String _selectedMenu = '';
  ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoggedUser>(
        builder: ((context, value, child) => PopupMenuButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(value.photoUrl.toString()),
                ),
              ),
              onSelected: (item) {
                _selectedMenu = item.toString();
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  onTap: () {
                    Navigator.of(context).pop();
                    Authentication.signOutGoogle();
                    LoggedUser().signOut();
                  },
                  child: const Text('Logout'),
                  value: 'value',
                ),
              ],
            )));
  }
}
