import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInAnonymously() async {
    User? user;
    UserCredential? response = await _auth.signInAnonymously();

    try {
      user = response.user;
      return user;
    } catch (error) {
      if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
        FirebaseCrashlytics.instance
            .setCustomKey('exception', error.toString());

        FirebaseCrashlytics.instance.recordError(error, null);
      }
      throw Exception(error);
    }
  }

  static Future<User?> signInWithGoogle() async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          throw Exception(e.message);
        } else if (e.code == 'invalid-credential') {
          throw Exception(e.message);
        }
      } catch (error) {
        if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
          FirebaseCrashlytics.instance
              .setCustomKey('exception', error.toString());

          FirebaseCrashlytics.instance.recordError(error, null);
        }

        throw Exception(error);
      }
      return user;
    }

    return user;
  }

  static void signOut() {
    GoogleSignIn().signOut();
    _auth.signOut();
  }
}
