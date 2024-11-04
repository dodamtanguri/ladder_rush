import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ladder_rush/widgets/ladder_painter.dart';

class LadderGameScreen extends StatelessWidget {
  final int participantCount;

  const LadderGameScreen({super.key, required this.participantCount});

  @override
  Widget build(BuildContext context) {
    final route =
        generateRandomRoute(columns: participantCount, rows: 10, p: 10);
    const double hGap = 100.0;
    const double vGap = 50.0;
    const double strokeWidth = 3.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ladder Game'),
      ),
      body: Center(
        child: CustomPaint(
          painter: LadderPainter(
            route: route,
            hGap: hGap,
            vGap: vGap,
            strokeWidth: strokeWidth,
            playerRadius: 20.0,
          ),
          child: Container(),
        ),
      ),
    );
  }

  List<List<int>> generateRandomRoute({
    required int columns,
    required int rows,
    required int p,
  }) {
    final random = Random();
    final route =
        List.generate(columns - 1, (_) => List.generate(rows, (_) => 0));
    bool canAddConnection(int col, int row) {
      bool hasHorizontalAbove = row > 0 && route[col][row - 1] == 1;

      bool hasHorizontalLeft = col > 0 && route[col - 1][row] == 1;

      bool hasDiagonalConflict = (row > 0 && route[col][row - 1] == 2) ||
          (row < rows - 1 && route[col][row + 1] == 3);

      bool hasSameDirectionDiagonalLeft = col > 0 &&
          ((route[col - 1][row] == 2 && route[col][row] == 2) ||
              (route[col - 1][row] == 3 && route[col][row] == 3));

      return !(hasHorizontalAbove ||
          hasHorizontalLeft ||
          hasDiagonalConflict ||
          hasSameDirectionDiagonalLeft);
    }

    void addConnection(int col, int row, int connectionType) {
      if (connectionType == 0) {
        route[col][row] = 1;
        if (col < columns - 2) {
          route[col + 1][row] = -1;
        }
      } else if (connectionType == 1 && row < rows - 1 && col < columns - 2) {
        if (route[col + 1][row + 1] == 0) {
          route[col][row] = 2;
          route[col + 1][row + 1] = -2;
        }
      } else if (connectionType == 2 && row > 0 && col < columns - 2) {
        if (route[col + 1][row - 1] == 0) {
          route[col][row] = 3;
          route[col + 1][row - 1] = -3;
        }
      }
    }

    for (int col = 0; col < columns - 1; col++) {
      for (int row = 0; row < rows; row++) {
        if (random.nextInt(10) < p && canAddConnection(col, row)) {
          int connectionType = random.nextInt(3);
          addConnection(col, row, connectionType);
        }
      }
    }

    return route;
  }
}
