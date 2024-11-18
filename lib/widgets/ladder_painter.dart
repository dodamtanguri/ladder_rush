import 'package:flutter/material.dart';
import 'package:ladder_rush/widgets/ladder_point_generator.dart';
import 'dart:ui' as ui;

class LadderPainter extends CustomPainter {
  final LadderInfo ladderInfo;
  final List<Map<String, dynamic>> players;
  final Map<int, List<Offset>> playerPaths;
  final int currentPlayerIndex;
  final List<Color> playerColors;

  LadderPainter({
    required this.ladderInfo,
    required this.players,
    required this.playerPaths,
    required this.currentPlayerIndex,
    required this.playerColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    const double avatarSize = 40.0;
    const double nameHeight = 3.0;
    const double additionalOffset = 20.0; // 추가적인 오프셋
    const double offsetY = avatarSize + nameHeight + additionalOffset;

    for (int i = 0; i < players.length; i++) {
      final player = players[i];
      final x = ladderInfo.xCoords[i];
      final image = player['image'] as ImageProvider;
      _drawImage(
        canvas,
        image,
        Offset(x.toDouble(),
            ladderInfo.vmargin + additionalOffset - avatarSize / 2),
        avatarSize,
      );

      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.text = TextSpan(
        text: player['name'],
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: 100,
      );
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2,
            ladderInfo.vmargin + additionalOffset + avatarSize / 2),
      );
    }

    for (int x in ladderInfo.xCoords) {
      canvas.drawLine(
        Offset(x.toDouble(), ladderInfo.vmargin + offsetY),
        Offset(x.toDouble(), ladderInfo.height.toDouble()),
        paint,
      );
    }

    for (var lines in ladderInfo.ladderLines) {
      for (var line in lines) {
        canvas.drawLine(
          Offset(line.sx.x.toDouble(), line.sx.y.toDouble() + offsetY),
          Offset(line.ex.x.toDouble(), line.ex.y.toDouble() + offsetY),
          paint,
        );
      }
    }

    final pathPaint = Paint()..strokeWidth = 3.0;
    playerPaths.forEach((index, path) {
      pathPaint.color = playerColors[index];
      for (int i = 0; i < path.length - 1; i++) {
        canvas.drawLine(path[i], path[i + 1], pathPaint);
      }

      // 아바타를 경로의 마지막 위치에 그리기
      if (path.isNotEmpty) {
        final lastPosition = path.last;
        final player = players[index];
        final image = player['image'] as ImageProvider;
        _drawImage(
          canvas,
          image,
          Offset(lastPosition.dx, lastPosition.dy - avatarSize / 2),
          avatarSize,
        );
      }
    });
  }

  void _drawImage(
      Canvas canvas, ImageProvider provider, Offset position, double size) {
    provider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        final ui.Image image = info.image;
        canvas.save();
        final clipPath = Path()
          ..addOval(Rect.fromCircle(center: position, radius: size / 2));
        canvas.clipPath(clipPath);
        final srcRect = Rect.fromLTWH(
          0,
          0,
          image.width.toDouble(),
          image.height.toDouble(),
        );
        final dstRect = Rect.fromCenter(
          center: position,
          width: size,
          height: size,
        );
        canvas.drawImageRect(image, srcRect, dstRect, Paint());
        canvas.restore();
      }),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
