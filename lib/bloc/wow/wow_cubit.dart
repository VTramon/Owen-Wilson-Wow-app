import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owen_wilson/bloc/wow/wow_state.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/models/api.dart';

class WowCubit extends Cubit<WowContentState> {
  WowCubit() : super(const LoadingWowContentState());

  showContentRandom(BuildContext context, {String? resultsLength}) async {
    WowWebclient().random(resultsLength: resultsLength).then((List<Api> value) {
      emit(LoadedWowContentState(value));
    }).catchError(
      (error) {
        emit(ErrorWowContentState(error));
      },
    );
  }

  showContentByMovie(BuildContext context,
      {required String movie, String? resultsLength}) async {
    WowWebclient()
        .byMovie(resultsLength: resultsLength, movie: movie)
        .then((List<Api> value) {
      emit(LoadedWowContentState(value));
    }).catchError(
      (error) {
        emit(ErrorWowContentState(error));
      },
    );
  }

  showContentByYear(BuildContext context,
      {required String year, String? resultsLength}) async {
    WowWebclient()
        .byYear(resultsLength: resultsLength, year: year.toString())
        .then((List<Api> value) {
      emit(LoadedWowContentState(value));
    }).catchError(
      (error) {
        emit(ErrorWowContentState(error));
      },
    );
  }
}
