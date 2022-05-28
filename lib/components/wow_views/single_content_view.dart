import 'package:flutter/material.dart';
import 'package:owen_wilson/components/video_viewer.dart';
import 'package:owen_wilson/models/api.dart';

class SingleContentView extends StatelessWidget {
  final Api data;
  const SingleContentView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.movie}'),
      ),
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
                title: Text('Current "wow": ${data.current_wow_in_movie}'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: VideoComponent(api: data),
              )
            ],
          )
        ],
      ),
    );
  }
}
