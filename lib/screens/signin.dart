import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:owen_wilson/firebase/authentication.dart';
import 'package:owen_wilson/models/logged_user.dart';
import 'package:owen_wilson/screens/home.dart';
import 'package:provider/provider.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GoogleSignInAccount? _currentUser;

  // @override
  // void initState() {
  //   _googleSignIn.onCurrentUserChanged.listen((account) {
  //     setState(() {
  //       _currentUser = account!;
  //     });
  //   });
  //   _googleSignIn.signInSilently();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Image.asset(
            'images/wow.png',
            width: 200.0,
            height: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0, left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GoogleSignInButton(),
                Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: AnonymousSignInButton(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  late User? user;
  GoogleSignInButton({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () async {
          user = await Authentication.signInWithGoogle();
          Provider.of<LoggedUser>(context, listen: false).signIn(user);

          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'images/google.png',
                width: 40,
                height: 40,
              ),
            ),
            const Text(
              'Sign in with Google',
            )
          ],
        ));
  }
}

class AnonymousSignInButton extends StatelessWidget {
  late User? user;
  AnonymousSignInButton({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () async {
          user = await Authentication.signInAnonymously();
          Provider.of<LoggedUser>(context, listen: false).signIn(user);

          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(padding: EdgeInsets.all(16.0), child: Icon(Icons.person)),
            Text(
              'Anonymous',
              style: TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ));
  }
}
