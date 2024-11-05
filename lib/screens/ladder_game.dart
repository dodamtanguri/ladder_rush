import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ladder_rush/models/ladder.dart';
import 'package:ladder_rush/utils/list_extension.dart';
import 'package:ladder_rush/widgets/ladder_painter.dart';

class LadderGameScreen extends StatelessWidget {
  final int participantCount;

  const LadderGameScreen({super.key, required this.participantCount});

  @override
  Widget build(BuildContext context) {
    makeLine();
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

  //중복체크
  bool hasDuplicatePoint(int verticalLineIndex, Point createdPoint,
      List<Line> lines, bool isStartPt) {
    var line = lines.firstWhere(
        (l) => isStartPt
            ? l.sx!.x == createdPoint.x && l.sx!.y == createdPoint.y
            : l.ex!.x == createdPoint.x && l.ex!.y == createdPoint.y,
        orElse: () => const Line());

    return !(line.sx == null && line.ex == null);
  }

  LadderEx makeLine() {
    LadderEx ladderEx = const LadderEx();
    final random = Random();
    Line line = const Line();
    List<Line> lines = List.empty(growable: true);
    int currentVerticalIndex = 0;
    int temp = 0;
    while (currentVerticalIndex < 3) {
      while (temp < 3) {
        //점하나 만드는 함수 만들어주는걸로 리팩토링 하기.
        // while (currentVerticalIndex < ladderEx.verticalCount) {
        //시작점 만들기
        while (true) {
          Point startPt = Point(
            y: random.nextInt(10),
            x: currentVerticalIndex * 10,
          );
          if (ladderEx.lines == null ||
              !hasDuplicatePoint(temp, startPt, ladderEx.lines!, true)) {
            line = line.copyWith(sx: startPt);
            break;
          }
        }
        //끝점 만들기

        while (true) {
          Point endPt = Point(
            y: random.nextInt(10),
            x: (currentVerticalIndex + 1) * 10,
          );
          if (ladderEx.lines == null ||
              !hasDuplicatePoint(temp, endPt, ladderEx.lines!, false)) {
            line = line.copyWith(ex: endPt);
            break;
          }
        }

        lines.add(line);
        if (ladderEx.lines == null) {
          ladderEx = ladderEx.copyWith(lines: List.empty(growable: true));
        }

        ladderEx = ladderEx.copyWith(lines: lines.copyAddAll(lines));
        // ladderEx.lineMap![currentVerticalIndex] = lines;
        //sorting 하기

        //currentVerticalIndex++;
        temp++;
      }
      temp = 0;
      currentVerticalIndex++;
    }
    for (Line line in ladderEx.lines!) {
      print('[line] : $line');
    }
    return ladderEx;
  }
}
