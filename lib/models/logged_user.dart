import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class LoggedUser extends ChangeNotifier {
  late String? displayName;
  late String? uid;
  late bool? logged;
  late String? photoUrl;

  LoggedUser({this.displayName, this.uid, this.logged, this.photoUrl});

  void signIn(User? user) {
    displayName = user?.displayName;
    uid = user?.uid;
    logged = true;
    photoUrl = user?.photoURL;

    final String userIdentifier = '${user?.uid}${user?.displayName}';
    FirebaseCrashlytics.instance.setUserIdentifier(userIdentifier);

    notifyListeners();
  }

  void signOut() {
    displayName = '';
    logged = false;
    photoUrl = '';

    notifyListeners();
  }
}
