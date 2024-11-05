import 'package:flutter/material.dart';

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

    for (int i = 0; i < route.length + 1; i++) {
      canvas.drawLine(
        Offset(i * hGap, 0),
        Offset(i * hGap, size.height),
        paint,
      );
    }

    for (int i = 0; i < route.length; i++) {
      for (int j = 0; j < route[i].length; j++) {
        switch (route[i][j]) {
          case 1: // 가로선
            canvas.drawLine(
              Offset(i * hGap, j * vGap),
              Offset((i + 1) * hGap, j * vGap),
              paint,
            );
            break;
          case 2: // 대각선 아래
            canvas.drawLine(
              Offset(i * hGap, j * vGap),
              Offset((i + 1) * hGap, (j + 1) * vGap),
              paint,
            );
            break;
          case 3: // 대각선 위로
            canvas.drawLine(
              Offset(i * hGap, j * vGap),
              Offset((i + 1) * hGap, (j - 1) * vGap),
              paint,
            );
            break;
          default:
            break;
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
