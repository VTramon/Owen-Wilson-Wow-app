import 'package:owen_wilson/models/api.dart';

abstract class WowContentState {
  const WowContentState();
}

class LoadingWowContentState extends WowContentState {
  const LoadingWowContentState();
}

// class InitWowContentState extends WowContentState {
//   const InitWowContentState();
// }

class LoadedWowContentState extends WowContentState {
  final List<Api> content;
  const LoadedWowContentState(this.content);
}

class ErrorWowContentState extends WowContentState {
  final dynamic error;
  const ErrorWowContentState(this.error);
}
