import 'package:flutter/material.dart';
import 'package:ladder_rush/widgets/ladder_painter.dart';
import 'dart:async';
import 'package:ladder_rush/widgets/ladder_point_generator.dart';
import 'dart:math';

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
  List<Color> playerColors = []; // 플레이어 색상

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

    // 플레이어 색상 초기화
    playerColors = List<Color>.generate(
        widget.players.length, (index) => _getRandomColor());
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  Future<void> _calculatePath(int playerIndex) async {
    final path = <Offset>[];
    int currentXIndex = playerIndex;
    const double avatarSize = 40.0;
    const double nameHeight = 3.0;
    const double additionalOffset = 20.0; // 추가적인 오프셋
    const double offsetY = avatarSize + nameHeight + additionalOffset;
    double currentY = ladderInfo.vmargin.toDouble() + offsetY;

    // 시작점 추가
    path.add(Offset(
      ladderInfo.xCoords[currentXIndex].toDouble(),
      currentY,
    ));

    setState(() {
      playerPaths[playerIndex] = List.from(path); // 초기 경로 저장
    });

    while (currentY < ladderInfo.height - ladderInfo.vmargin) {
      if (currentXIndex < 0 || currentXIndex >= ladderInfo.xCoords.length) {
        break;
      }

      bool movedHorizontally = false;

      // 현재 수직선의 수평선을 찾음
      for (var line in ladderInfo.ladderLines[currentXIndex]) {
        if ((line.sx.y - (currentY - offsetY)).abs() < 0.1) {
          int newIndex = ladderInfo.xCoords.indexOf(line.ex.x);
          if (newIndex == -1) continue;

          currentXIndex = newIndex;
          currentY = line.ex.y.toDouble() + offsetY;
          path.add(Offset(line.ex.x.toDouble(), currentY));
          movedHorizontally = true;
          break;
        }
      }

      if (!movedHorizontally) {
        currentY += 5; // 이동 속도 조정
        path.add(Offset(
          ladderInfo.xCoords[currentXIndex].toDouble(),
          currentY,
        ));
      }

      setState(() {
        playerPaths[playerIndex] = List.from(path);
      });

      await Future.delayed(const Duration(milliseconds: 100));
    }

    // 디버깅 경로 출력
    for (var point in path) {
      print('Path point: ${point.dx}, ${point.dy}');
    }
  }

  void _onPlayerTap(int playerIndex) {
    if (isGameActive) return;
    setState(() {
      isGameActive = true;
      currentPlayerIndex = playerIndex;
    });

    _calculatePath(playerIndex).then((_) async {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isGameActive = false;
        currentPlayerIndex = -1; // 초기화
      });
    });
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
            playerColors: playerColors,
          ),
        ),
      ),
    );
  }
}
