import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:owen_wilson/components/buttons/wow_button.dart';
import 'package:owen_wilson/components/wow_options_forms/by_director.dart';
import 'package:owen_wilson/components/wow_options_forms/by_movie.dart';
import 'package:owen_wilson/components/wow_options_forms/by_year.dart';
import 'package:owen_wilson/components/wow_options_forms/random.dart';
import 'package:owen_wilson/screens/options.dart';

void main() {
  testWidgets('Should display the row of WowButtons', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OptionScreen(),
    ));

    expect(find.widgetWithText(WowButton, 'Random'), findsOneWidget);

    expect(find.widgetWithText(WowButton, 'By year'), findsOneWidget);

    expect(find.widgetWithText(WowButton, 'By movie'), findsOneWidget);

    expect(find.widgetWithText(WowButton, 'By director'), findsOneWidget);
  });

  testWidgets('Should display the RandomForm when click on WowButton(random)',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OptionScreen(),
    ));

    await clickOnButtonToRenderTheForm(
        tester, WowButton, 'Random', RandomForm, 'Random');
  });

  testWidgets('Should display the ByYear form when click on WowButton(By year)',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OptionScreen(),
    ));

    await clickOnButtonToRenderTheForm(
        tester, WowButton, 'By year', ByYear, 'By year');
  });

  testWidgets(
      'Should display the ByMovie form when click on WowButton(By movie)',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OptionScreen(),
    ));

    await clickOnButtonToRenderTheForm(
        tester, WowButton, 'By movie', ByMovie, 'By movie');
  });

  testWidgets(
      'Should display the ByDirector form when click on WowButton(By director)',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OptionScreen(),
    ));

    await clickOnButtonToRenderTheForm(
        tester, WowButton, 'By director', ByDirector, 'By director');
  });
}

Future<void> clickOnButtonToRenderTheForm(WidgetTester tester, Type button,
    String buttonText, Type form, String formText) async {
  expect(find.widgetWithText(form, formText), findsNothing);

  await tester.tap(find.widgetWithText(button, buttonText));
  await tester.pumpAndSettle();

  expect(find.widgetWithText(form, formText), findsOneWidget);
}
