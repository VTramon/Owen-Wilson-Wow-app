import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:owen_wilson/components/buttons/screen_button.dart';
import 'package:owen_wilson/components/text_card.dart';
import 'package:owen_wilson/models/logged_user.dart';
import 'package:owen_wilson/screens/home.dart';
import 'package:provider/provider.dart';

void main() async {
  // late User? user;

  // setUp(() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await FakeFirebase.initializeApp();
  //   final credential = await MockFirebaseAuth().signInAnonymously();
  //   user = credential.user;
  //   debugPrint(user.toString());
  // });

  testWidgets('Should display the screen header (Appbar)', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => LoggedUser(
            logged: true,
            uid: 'some uuid',
            displayName: 'some Name',
            photoUrl:
                'https://static.wikia.nocookie.net/avatar/images/3/31/Korra_smiling.png/revision/latest?cb=20200907192928',
          ),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.widgetWithImage(Container, const AssetImage('images/wow.png')),
        findsOneWidget);
    expect(
        find.widgetWithText(Container, 'Owen\nWilson\nwows'), findsOneWidget);
  });

  testWidgets('Should display the button that leads to options screen',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => LoggedUser(
            logged: true,
            uid: 'some uuid',
            displayName: 'some Name',
            photoUrl:
                'https://static.wikia.nocookie.net/avatar/images/3/31/Korra_smiling.png/revision/latest?cb=20200907192928',
          ),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.widgetWithText(ScreenButtonComponent, 'WOW'), findsOneWidget);
  });

  testWidgets('Should display the introduction texts about Owen Wilson',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => LoggedUser(
            logged: true,
            uid: 'some uuid',
            displayName: 'some Name',
            photoUrl:
                'https://static.wikia.nocookie.net/avatar/images/3/31/Korra_smiling.png/revision/latest?cb=20200907192928',
          ),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(
        find.widgetWithText(TextCard,
            'If you already know about Owen Wilson, you can just click on the button above.'),
        findsOneWidget);
    expect(
        find.widgetWithText(TextCard,
            "Owen Cunningham Wilson (born November 18, 1968)[3] is an American actor. He has had a long association with filmmaker Wes Anderson with whom he shared writing and acting credits for Bottle Rocket (1996), Rushmore (1998), and The Royal Tenenbaums (2001), the last of which earned him a nomination for the Academy Award and BAFTA Award for Best Screenplay. He has also appeared in Anderson's The Life Aquatic with Steve Zissou (2004), The Darjeeling Limited (2007), The Grand Budapest Hotel (2014), and The French Dispatch (2021). Wilson also starred in the Woody Allen romantic comedy Midnight in Paris (2011) as unsatisfied screenwriter Gil Pender, a role which earned him a Golden Globe Award nomination. In 2014 he appeared in Paul Thomas Anderson's Inherent Vice, and Peter Bogdanovich's She's Funny That Way."),
        findsOneWidget);
  });
}
