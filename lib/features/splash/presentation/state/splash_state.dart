import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initializing() = _Initializing;
  const factory SplashState.playingNarrative({required int currentSceneIndex}) =
      _PlayingNarrative;
  const factory SplashState.playingShort() = _PlayingShort;
  const factory SplashState.completed({required String nextRoute}) = _Completed;
  const factory SplashState.error({required String message}) = _Error;
}
