import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owen_wilson/bloc/wow/wow_state.dart';
import 'package:owen_wilson/http/webclients/wow_webclient.dart';
import 'package:owen_wilson/models/api.dart';

class WowCubit extends Cubit<WowContentState> {
  WowCubit() : super(const LoadingWowContentState());

  showContent(BuildContext context, {String? resultsLength}) async {
    WowWebclient().random(resultsLength: resultsLength).then((List<Api> value) {
      emit(LoadedWowContentState(value));
    }).catchError(
      (error) {
        emit(ErrorWowContentState(error));
      },
    );
  }
}
