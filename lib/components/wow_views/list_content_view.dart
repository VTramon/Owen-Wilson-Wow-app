import 'package:flutter/material.dart';
import 'package:owen_wilson/components/wow_views/single_content_view.dart';
import 'package:owen_wilson/models/api.dart';

class ListContentView extends StatelessWidget {
  final List<Api> data;
  const ListContentView(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random List'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, index) {
          final Api result = data[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (builder) => SingleContentView(
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
