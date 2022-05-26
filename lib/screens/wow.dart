import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owen_wilson/bloc/wow/wow_cubit.dart';
import 'package:owen_wilson/bloc/wow/wow_state.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/error_message.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/models/api.dart';

class WowContainer extends BlocContainer {
  final String? resultsLength;

  const WowContainer({Key? key, this.resultsLength = '1'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WowCubit>(
      create: (BuildContext context) {
        final cubit = WowCubit();

        cubit.showContent(context, resultsLength: resultsLength);
        return cubit;
      },
      child: BlocListener<WowCubit, WowContentState>(
          listener: (context, state) {
            if (state is ErrorWowContentState) {
              showDialog(
                context: context,
                builder: (context) {
                  return ErrorMessageCard(errorMessage: state.error.message);
                },
              );
            }
          },
          child: const WowContentView()),
    );
  }
}

class WowContentView extends StatelessWidget {
  const WowContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WowCubit, WowContentState>(
        builder: (BuildContext context, WowContentState state) {
          debugPrint(state.runtimeType.toString());
          if (state is ErrorWowContentState) {
            final error = state.error;

            if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
              FirebaseCrashlytics.instance
                  .setCustomKey('exception', error.toString());

              FirebaseCrashlytics.instance
                  .setCustomKey('http_code', error.statusCode);

              FirebaseCrashlytics.instance.recordError(error, null);
            }
            return const _DefaultReturn(loading: false);
          }

          if (state is LoadedWowContentState) {
            final List<Api> content = state.content;
            if (content.length == 1) {
              return SingleContent(data: content.first);
            }
            return ListContent(content);
          }

          return const _DefaultReturn(loading: true);
        },
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class WowScreen extends StatefulWidget {
  final String? resultsLength;
  const WowScreen({Key? key, this.resultsLength = '1'}) : super(key: key);

  @override
  State<WowScreen> createState() => _WowScreenState();
}

class _WowScreenState extends State<WowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future:
          WowWebclient().random(resultsLength: widget.resultsLength).catchError(
        (error) {
          if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
            FirebaseCrashlytics.instance
                .setCustomKey('exception', error.toString());

            FirebaseCrashlytics.instance
                .setCustomKey('http_code', error.statusCode);

            FirebaseCrashlytics.instance.recordError(error, null);
          }

          showDialog(
            context: context,
            builder: (context) {
              return ErrorMessageCard(errorMessage: error.message);
            },
          );
          return error.message;
        },
      ),
      builder: (BuildContext context, AsyncSnapshot<List<Api>> snapshot) {
        final data = snapshot.data;

        if (snapshot.hasError) {
          return const _DefaultReturn(loading: false);
        }

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            return const _DefaultReturn(loading: true);

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            if (data!.length > 1) {
              return ListContent(data);
            } else {
              return SingleContent(data: data.first);
            }
        }

        return const _DefaultReturn(loading: true);
      },
    ));
  }
}

class _DefaultReturn extends StatefulWidget {
  final bool loading;
  final bool? onError;
  final String? error;
  const _DefaultReturn(
      {Key? key, required this.loading, this.onError, this.error})
      : super(key: key);

  @override
  State<_DefaultReturn> createState() => _DefaultReturnState();
}

class _DefaultReturnState extends State<_DefaultReturn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              child: const CircularProgressIndicator(),
              visible: widget.loading == true,
            ),
            Visibility(
              visible: widget.loading == false,
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
  final List<Api> data;
  const ListContent(this.data, {Key? key}) : super(key: key);

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
