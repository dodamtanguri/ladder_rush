import 'package:freezed_annotation/freezed_annotation.dart';

part "ladder.freezed.dart";

@freezed
class Ladder with _$Ladder {
  const factory Ladder({
    required List<List<int>> route,
  }) = _Ladder;
}

@freezed
class Point with _$Point {
  const factory Point({
    required int x,
    required int y,
  }) = _Point;
}

@freezed
class Line with _$Line {
  const factory Line({
    Point? sx,
    Point? ex,
  }) = _Line;
}

@freezed
class LadderEx with _$LadderEx {
  const factory LadderEx({
    @Default(5) int verticalCount,
    List<Line>? lines,
  }) = _LadderExt;
}
