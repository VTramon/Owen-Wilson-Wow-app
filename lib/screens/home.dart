// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:owen_wilson/components/button.dart';
import 'package:owen_wilson/components/text_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'images/wow.png',
                width: 95.0,
                height: 95.0,
                fit: BoxFit.cover,
              ),
              Text(
                'Owen\nWilson\nwows',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'RedRose',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: 144,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(62.0),
            ),
          ),
        ),
        body: _HomeBody());
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Center(
              child: ButtonComponent(
            title: 'WOW',
          )),
        ),
        TextCard(
          content: '',
          children: [
            TextSpan(
                text:
                    'If you already know about Owen Wilson, you can just click on the button above.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
        TextCard(
            content:
                "Owen Cunningham Wilson (born November 18, 1968)[3] is an American actor. He has had a long association with filmmaker Wes Anderson with whom he shared writing and acting credits for Bottle Rocket (1996), Rushmore (1998), and The Royal Tenenbaums (2001), the last of which earned him a nomination for the Academy Award and BAFTA Award for Best Screenplay. He has also appeared in Anderson's The Life Aquatic with Steve Zissou (2004), The Darjeeling Limited (2007), The Grand Budapest Hotel (2014), and The French Dispatch (2021). Wilson also starred in the Woody Allen romantic comedy Midnight in Paris (2011) as unsatisfied screenwriter Gil Pender, a role which earned him a Golden Globe Award nomination. In 2014 he appeared in Paul Thomas Anderson's Inherent Vice, and Peter Bogdanovich's She's Funny That Way."),
        TextCard(
          content:
              "Wilson is also known for his career as an onscreen comedian and member of the Frat Pack including starring in such comedies as Zoolander (2001), Starsky & Hutch (2004), Wedding Crashers (2005), You, Me and Dupree (2006), How Do You Know (2010), The Big Year (2011), and The Internship (2013). He is also known for the family films Marley and Me (2008), and the Night at the Museum film series (2005–2014). He voices Lightning McQueen in the Cars film series (2006–present), Coach Skip in Fantastic Mr. Fox (2009), the title character in Marmaduke (2010) and Reggie in Free Birds (2013). He stars as Mobius M. Mobius in the Disney+ series Loki (2021–present).",
        ),
      ],
    );
  }
}
