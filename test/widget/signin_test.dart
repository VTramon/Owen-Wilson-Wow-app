import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:owen_wilson/screens/signin.dart';

void main() {
  testWidgets('Should display the logo', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignInScreen()));

    expect(find.image(const AssetImage('images/wow.png')), findsOneWidget);
  });
  testWidgets('Should display the signin buttons', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignInScreen()));

    expect(find.widgetWithText(SignInButton, 'Sign in with Google'),
        findsOneWidget);

    expect(find.widgetWithIcon(SignInButton, Icons.person), findsOneWidget);
  });
}
