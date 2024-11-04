import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part "ladder.freezed.dart";

@freezed
class Ladder with _$Ladder {
  const factory Ladder({
    required List<List<int>> route,
  }) = _Ladder;
}
