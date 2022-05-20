// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

// class SignInScreen extends StatefulWidget {
//   late GoogleSignInAccount? _currentUser;
//   SignInScreen({Key? key}) : super(key: key);

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         widget._currentUser = account!;
//       });
//     });
//     _googleSignIn.signInSilently();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
//           Image.asset(
//             'images/wow.png',
//             width: 200.0,
//             height: 200.0,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: const [
//                 ElevatedButton(
//                   onPressed: signIn,
//                   child: Text('Login'),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// void signOut() {
//   _googleSignIn.disconnect();
// }

// Future<void> signIn() async {
//   try {
//     await _googleSignIn.signIn();
//   } catch (e) {
//     debugPrint('Error signing in $e');
//   }
// }
