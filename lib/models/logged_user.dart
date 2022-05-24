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
    if (user!.photoURL != null) {
      photoUrl = user.photoURL;
    } else {
      photoUrl =
          'https://upload.wikimedia.org/wikipedia/commons/b/b7/Owen_Wilson_Cannes_2011_%28cropped%29.jpg';
    }

    if (user.isAnonymous == true) {
      final String userIdentifier = 'anonymous${user.uid}';
      FirebaseCrashlytics.instance.setUserIdentifier(userIdentifier);
    } else {
      final String userIdentifier = '${user.uid}${user.displayName}';
      FirebaseCrashlytics.instance.setUserIdentifier(userIdentifier);
    }

    notifyListeners();
  }

  void signOut() {
    displayName = '';
    logged = false;
    photoUrl = '';

    notifyListeners();
  }
}
