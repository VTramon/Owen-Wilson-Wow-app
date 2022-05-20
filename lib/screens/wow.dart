import 'package:flutter/material.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/models/api.dart';

class WowScreen extends StatefulWidget {
  final String? resultsLength;
  const WowScreen({Key? key, this.resultsLength = '1'}) : super(key: key);

  @override
  State<WowScreen> createState() => _WowScreenState();
}

class _WowScreenState extends State<WowScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WowWebclient().random(resultsLength: widget.resultsLength),
      builder: (BuildContext context, AsyncSnapshot<List<Api>> snapshot) {
        final data = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            return const _DefaultReturn(loading: true);
          // return const Scaffold(
          //   body: Center(child: CircularProgressIndicator()),
          // );

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            if (data!.length > 1) {
              return ListContent(data);
            } else {
              return SingleContent(data: data.first);
            }
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

class SingleContent extends StatelessWidget {
  final Api data;
  const SingleContent({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${data.movie}')),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Image.network('${data.poster}'),
          ),
          ListTile(
            title: Text(
              data.year.toString(),
              style: const TextStyle(fontSize: 32.0),
            ),
          ),
          ListBody(
            children: [
              ListTile(
                title: Text('Character: ${data.character}'),
              ),
              ListTile(
                title: Text('Director: ${data.director}'),
              ),
              ListTile(
                title: Text('Release date: ${data.release_date}'),
              ),
              ListTile(
                title: Text('Movie duration: ${data.movie_duration}'),
              ),
              ListTile(
                title: Text('Number of "wows": ${data.total_wows_in_movie}'),
              ),
              ListTile(
                title: Text('Movie duration: ${data.movie_duration}'),
              ),
              // VideoComponent(videoUrl: data!.video!.medium.toString())
            ],
          )
        ],
      ),
    );
  }
}

class ListContent extends StatelessWidget {
  final List<Api>? data;
  // final loading;
  const ListContent(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random List'),
      ),
      body: ListView.builder(
        itemCount: data?.length,
        itemBuilder: (BuildContext context, index) {
          final Api result = data![index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => SingleContent(
                        data: result,
                      )));
            },
            child: Card(
              child: Row(
                children: [
                  Image.network(
                    result.poster.toString(),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    height: 250,
                  ),
                  SizedBox(
                    width: 150,
                    child: ListTile(
                      title: Text(result.movie.toString()),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
