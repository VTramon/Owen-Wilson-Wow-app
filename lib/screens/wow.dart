import 'package:flutter/material.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/models/api.dart';

class WowScreen extends StatefulWidget {
  const WowScreen({Key? key}) : super(key: key);

  @override
  State<WowScreen> createState() => _WowScreenState();
}

class _WowScreenState extends State<WowScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WowWebclient().random().then((value) => value.first),
      builder: (BuildContext context, AsyncSnapshot<Api> snapshot) {
        final data = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            return const _DefaultReturn(loading: true);

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            return Scaffold(
              appBar: AppBar(title: Text('${data?.movie}')),
              body: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Image.network('${data?.poster}'),
                  ),
                  ListTile(
                    title: Text(
                      snapshot.data!.year.toString(),
                      style: const TextStyle(fontSize: 32.0),
                    ),
                  ),
                  ListBody(
                    children: [
                      ListTile(
                        title: Text('Character: ${data?.character}'),
                      ),
                      ListTile(
                        title: Text('Director: ${data?.director}'),
                      ),
                      ListTile(
                        title: Text('Release date: ${data?.release_date}'),
                      ),
                      ListTile(
                        title: Text('Movie duration: ${data?.movie_duration}'),
                      ),
                      ListTile(
                        title: Text(
                            'Number of "wows": ${data?.total_wows_in_movie}'),
                      ),
                      ListTile(
                        title: Text('Movie duration: ${data?.movie_duration}'),
                      ),
                      // VideoComponent(videoUrl: data!.video!.medium.toString())
                    ],
                  )
                ],
              ),
            );
        }

        return const _DefaultReturn(
          loading: false,
        );
      },
    );
  }
}

class _DefaultReturn extends StatelessWidget {
  final bool loading;
  const _DefaultReturn({Key? key, required this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: const CircularProgressIndicator(),
              visible: loading == true,
            ),
            Visibility(
              visible: loading == false,
              child: const Text(
                'Unknown error',
                style: TextStyle(
                    backgroundColor: Colors.transparent, color: Colors.black),
              ),
            ),
            Visibility(
              visible: loading == false,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
