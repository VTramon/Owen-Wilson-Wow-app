import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owen_wilson/bloc/wow/wow_cubit.dart';
import 'package:owen_wilson/bloc/wow/wow_state.dart';
import 'package:owen_wilson/components/bloc_container.dart';
import 'package:owen_wilson/components/error_message.dart';
import 'package:owen_wilson/components/wow_views/list_content_view.dart';
import 'package:owen_wilson/components/wow_views/single_content_view.dart';
import 'package:owen_wilson/models/api.dart';

class WowContainer extends BlocContainer {
  final String? resultsLength;
  final String content;
  final String? movie;
  final String? year;
  final String? director;

  const WowContainer(
      {Key? key,
      this.resultsLength = '1',
      this.movie,
      this.year,
      this.director,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WowCubit>(
      create: (BuildContext context) {
        final cubit = WowCubit();

        if (content == 'byMovie') {
          cubit.showContentByMovie(context,
              resultsLength: resultsLength, movie: movie!);
          return cubit;
        }

        if (content == 'byYear') {
          cubit.showContentByYear(context,
              resultsLength: resultsLength, year: year!);
          return cubit;
        }

        if (content == 'byDirector') {
          cubit.showContentByDirector(context,
              resultsLength: resultsLength, director: director!);
          return cubit;
        }

        cubit.showContentRandom(context, resultsLength: resultsLength);
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
              return SingleContentView(data: content.first);
            }
            return ListContentView(content);
          }

          return const _DefaultReturn(loading: true);
        },
      ),
    );
  }
}

class _DefaultReturn extends StatefulWidget {
  final bool loading;
  const _DefaultReturn({Key? key, required this.loading}) : super(key: key);

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
