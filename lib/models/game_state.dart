import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.ready() = Ready;
  const factory GameState.ing() = Ing;
}
