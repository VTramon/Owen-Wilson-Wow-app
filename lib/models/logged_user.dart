import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedUser extends ChangeNotifier {
  late String? displayName;
  late bool? logged;
  late String? photoUrl;

  LoggedUser({this.displayName, this.logged, this.photoUrl});

  void signIn(User? user) {
    displayName = user?.displayName;
    logged = true;
    photoUrl = user?.photoURL;

    notifyListeners();
  }

  void signOut() {
    displayName = '';
    logged = false;
    photoUrl = '';

    notifyListeners();
  }
}
