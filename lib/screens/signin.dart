// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:owen_wilson/firebase/authentication.dart';
import 'package:owen_wilson/models/logged_user.dart';
import 'package:owen_wilson/screens/home.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WillPopScope(
        onWillPop: () async => false,
        child: ListView(
          children: [
            Image.asset(
              'images/wow.png',
              width: 200.0,
              height: 200.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 160.0, left: 16.0, right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SignInButton(
                    onPressed: () async {
                      user = await Authentication.signInWithGoogle();
                      Provider.of<LoggedUser>(context, listen: false)
                          .signIn(user);

                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    text: 'Sign in with Google',
                    image: Image.asset(
                      'images/google.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: SignInButton(
                        onPressed: () async {
                          user = await Authentication.signInAnonymously();
                          Provider.of<LoggedUser>(context, listen: false)
                              .signIn(user);

                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        text: 'Anonymous',
                        icon: const Icon(Icons.person)),
                    // child: AnonymousSignInButton(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  // late User? user;
  final void Function() onPressed;
  final String text;
  final Icon? icon;
  final Image? image;
  const SignInButton(
      {Key? key,
      // this.user,
      required this.onPressed,
      required this.text,
      this.icon,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(16.0), child: image ?? icon),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ));
  }
}
