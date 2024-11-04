import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'player.freezed.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required int id,
    required Image image,
    required Color color,
    required int productId,
  }) = _Player;
}
