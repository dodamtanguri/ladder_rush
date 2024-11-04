import 'package:flutter/material.dart';
import 'package:ladder_rush/widgets/ladder_painter.dart';

class LadderGameWidget extends StatelessWidget {
  const LadderGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample route matrix
    final route = [
      [1, 0, 2], // First column with horizontal and diagonal down connections
      [0, 3, 1], // Second column with diagonal up and horizontal connections
      [2, 1, 0], // Third column with diagonal down and horizontal connections
    ];

    // Sample gap and stroke width values
    const double hGap = 100.0; // Horizontal gap between vertical lines
    const double vGap = 50.0; // Vertical gap between rows
    const double strokeWidth = 3.0; // Thickness of ladder lines
    const double playerRadius =
        20.0; // Radius for player circle (for demonstration)

    return Listener(
      onPointerDown: (details) {
        // Handle pointer down event, if needed
      },
      onPointerUp: (details) {
        // Handle pointer up event, if needed
      },
      child: CustomPaint(
        painter: LadderPainter(
          route: route,
          hGap: hGap,
          vGap: vGap,
          strokeWidth: strokeWidth,
          playerRadius: playerRadius,
        ),
        child: Container(),
      ),
    );
  }
}
