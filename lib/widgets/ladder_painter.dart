import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ladder_rush/widgets/ladder_point_generator.dart';
import 'dart:ui' as ui;

class LadderPainter extends CustomPainter {
  final LadderInfo ladderInfo;
  final List<Map<String, dynamic>> players;
  final Map<int, List<Offset>> playerPaths; // 각 플레이어의 이동 경로
  final int currentPlayerIndex; // 현재 이동 중인 플레이어

  LadderPainter({
    required this.ladderInfo,
    required this.players,
    required this.playerPaths,
    required this.currentPlayerIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    // 아바타와 이름 영역 높이 설정
    const double avatarSize = 40.0; // 아바타 크기
    const double nameHeight = 3.0; // 이름 높이
    const double offsetY = avatarSize + nameHeight;

    // 1. Draw player avatars and names
    for (int i = 0; i < players.length; i++) {
      final player = players[i];
      final x = ladderInfo.xCoords[i];

      // Draw avatar
      final image = player['image'] as ImageProvider;
      _drawImage(
          canvas,
          image,
          Offset(x.toDouble(), ladderInfo.vmargin - avatarSize / 2),
          avatarSize);

      // Draw player name below avatar
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
        Offset(x - textPainter.width / 2, ladderInfo.vmargin + avatarSize / 2),
      );
    }

    // 2. Draw vertical ladder lines
    for (int x in ladderInfo.xCoords) {
      canvas.drawLine(
        Offset(x.toDouble(), ladderInfo.vmargin + offsetY),
        Offset(x.toDouble(), ladderInfo.height.toDouble()),
        paint,
      );
    }

    // 3. Draw horizontal ladder lines
    for (var lines in ladderInfo.ladderLines) {
      for (var line in lines) {
        canvas.drawLine(
          Offset(line.sx.x.toDouble(), line.sx.y.toDouble() + offsetY),
          Offset(line.ex.x.toDouble(), line.ex.y.toDouble() + offsetY),
          paint,
        );
      }
    }

    // 4. Draw player paths
    final pathPaint = Paint()..strokeWidth = 3.0;

    playerPaths.forEach((index, path) {
      pathPaint.color = index == currentPlayerIndex ? Colors.red : Colors.blue;

      for (int i = 0; i < path.length - 1; i++) {
        canvas.drawLine(path[i], path[i + 1], pathPaint);
      }
    });
  }

  // Helper method to draw circular avatar images
  void _drawImage(
      Canvas canvas, ImageProvider provider, Offset position, double size) {
    provider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        final ui.Image image = info.image;

        // Save the canvas state
        canvas.save();

        // Create a circular clip path
        final clipPath = Path()
          ..addOval(Rect.fromCircle(center: position, radius: size / 2));
        canvas.clipPath(clipPath);

        // Define source and destination rectangles
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

        // Draw the image within the clipped circle
        canvas.drawImageRect(image, srcRect, dstRect, Paint());

        // Restore the canvas state
        canvas.restore();
      }),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
