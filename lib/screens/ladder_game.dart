import 'package:flutter/material.dart';
import 'package:ladder_rush/widgets/ladder_painter.dart';
import 'dart:async';
import 'package:ladder_rush/widgets/ladder_point_generator.dart';

class LadderGameScreen extends StatefulWidget {
  final List<Map<String, dynamic>> players; // 플레이어 정보

  const LadderGameScreen({super.key, required this.players});

  @override
  _LadderGameScreenState createState() => _LadderGameScreenState();
}

class _LadderGameScreenState extends State<LadderGameScreen> {
  late LadderInfo ladderInfo;
  late LadderPointGenerator generator;

  Map<int, List<Offset>> playerPaths = {}; // 각 플레이어의 이동 경로
  bool isGameActive = false; // 게임 상태
  int currentPlayerIndex = -1; // 현재 이동 중인 플레이어

  @override
  void initState() {
    super.initState();

    // 사다리 생성
    generator = LadderPointGenerator(
      width: 400,
      height: 600,
      verticalLineCount: widget.players.length,
      hmargin: 20,
      vmargin: 20,
      minPointCount: 2,
      maxPointCount: 4,
    );
    ladderInfo = generator.generateLadderPoints();
  }

  void _onPlayerTap(int playerIndex) {
    if (isGameActive) return; // 게임 중 클릭 무시

    setState(() {
      isGameActive = true; // 게임 시작
      currentPlayerIndex = playerIndex; // 현재 플레이어 설정
    });

    // 이동 경로 계산
    final path = _calculatePath(playerIndex);

    setState(() {
      playerPaths[playerIndex] = path; // 경로 저장
    });

    // 이동 완료 후 상태 초기화
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isGameActive = false;
        currentPlayerIndex = -1; // 초기화
      });
    });
  }

  List<Offset> _calculatePath(int playerIndex) {
    final path = <Offset>[];
    int currentXIndex = playerIndex;
    double currentY = 0;

    // 시작점 추가
    path.add(Offset(
      ladderInfo.xCoords[currentXIndex].toDouble(),
      ladderInfo.vmargin.toDouble(),
    ));

    // 사다리 규칙에 따라 이동 경로 계산
    for (var lines in ladderInfo.ladderLines) {
      final currentLine = lines.firstWhere(
        (line) =>
            line.sx.x == ladderInfo.xCoords[currentXIndex] &&
            line.sx.y >= currentY,
        orElse: () => Line(Point(0, 0), Point(0, 0)),
      );

      if (currentLine.ex.x != 0) {
        currentXIndex =
            ladderInfo.xCoords.indexOf(currentLine.ex.x); // 이동 방향 변경
        currentY = currentLine.ex.y.toDouble();
        path.add(
            Offset(currentLine.ex.x.toDouble(), currentLine.ex.y.toDouble()));
      } else {
        break;
      }
    }

    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ladder Game")),
      body: GestureDetector(
        onTapUp: (details) {
          final tapX = details.localPosition.dx;

          // 클릭한 플레이어 찾기
          final playerIndex = ladderInfo.xCoords
              .indexWhere((x) => (x - 20 <= tapX && x + 20 >= tapX));

          if (playerIndex != -1) {
            _onPlayerTap(playerIndex);
          }
        },
        child: CustomPaint(
          size: Size(generator.width.toDouble(), generator.height.toDouble()),
          painter: LadderPainter(
            ladderInfo: ladderInfo,
            players: widget.players,
            playerPaths: playerPaths,
            currentPlayerIndex: currentPlayerIndex,
          ),
        ),
      ),
    );
  }
}
