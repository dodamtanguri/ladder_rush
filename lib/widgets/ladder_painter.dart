import 'package:flutter/material.dart';
import 'dart:math';

class LadderPainter extends CustomPainter {
  final List<List<int>> route;
  final double hGap;
  final double vGap;
  final double strokeWidth;
  final double playerRadius;

  LadderPainter({
    required this.route,
    required this.hGap,
    required this.vGap,
    required this.strokeWidth,
    required this.playerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth;

    // Draw vertical ladder lines
    for (int i = 0; i < route.length; i++) {
      canvas.drawLine(
        Offset(i * hGap, 0),
        Offset(i * hGap, size.height),
        paint,
      );

      // Draw horizontal or diagonal connections between lines
      for (int j = 0; j < route[i].length; j++) {
        switch (route[i][j]) {
          case 1: // Horizontal line
            canvas.drawLine(
              Offset(i * hGap, j * vGap),
              Offset((i + 1) * hGap, j * vGap),
              paint,
            );
            break;
          case 2: // Diagonal line downwards
            canvas.drawLine(
              Offset(i * hGap, j * vGap),
              Offset((i + 1) * hGap, (j + 1) * vGap),
              paint,
            );
            break;
          case 3: // Diagonal line upwards
            canvas.drawLine(
              Offset(i * hGap, j * vGap),
              Offset((i + 1) * hGap, (j - 1) * vGap),
              paint,
            );
            break;
          default:
            // No line
            break;
        }
      }
    }

    // Draw sample player circles at the top of each vertical line
    final playerPaint = Paint()..color = Colors.blue;
    for (int i = 0; i < route.length; i++) {
      final playerPosition = Offset(i * hGap + hGap / 2, playerRadius);
      canvas.drawCircle(playerPosition, playerRadius, playerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
