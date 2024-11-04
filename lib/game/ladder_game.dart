import 'package:ladder_rush/models/ladder.dart';
import 'package:ladder_rush/models/player.dart';

import '../models/game_state.dart';

class LadderGame {
  List<Player> players;
  Ladder ladder;
  double hGap;
  double strokeWidth;
  double playerHeight;
  double playerWidth;
  double productHeight;
  double productWidth;
  double tickCount;
  Player? currentPlayer;
  GameState state = const GameState.ready();

  LadderGame({
    required this.players,
    required this.ladder,
    required this.hGap,
    required this.strokeWidth,
    required this.playerHeight,
    required this.playerWidth,
    required this.productHeight,
    required this.productWidth,
    required this.tickCount,
  });

  void startGame() {
    // Set up initial game state, choose currentPlayer, etc.
    state = const GameState.ing();
  }

  void resetGame() {
    // Reset game state
    state = const GameState.ready();
    currentPlayer = null;
  }

  void updatePlayerPosition() {
    if (currentPlayer == null || state != GameState.ing) return;

    // Update the current player’s position by one tick.
    // Implement ladder navigation logic here based on the route and tickCount.

    // Example: Move the player a small step forward along their path
    // You may add the logic for finding the next ladder step and adjusting the player's position.
  }
}
