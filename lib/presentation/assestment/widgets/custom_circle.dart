import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgressIndicator extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0
  final Color backgroundColor;
  final Color valueColor;
  final double strokeWidth;
  final double size; // Dynamic size of the progress indicator

  CustomCircularProgressIndicator({
    required this.progress,
    this.backgroundColor = const Color.fromARGB(255, 99, 97, 97),
    this.valueColor = Colors.green,
    this.strokeWidth = 8.0,
    this.size = 100.0, // Default size
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size), // Use dynamic size
      painter: _CustomCircularProgressPainter(
        progress: progress,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _CustomCircularProgressPainter extends CustomPainter {
  final double progress; // Value between 0.0 and 1.0
  final Color backgroundColor;
  final Color valueColor;
  final double strokeWidth;

  _CustomCircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.valueColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth*.5 // Use dynamic stroke width
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth*1.1 // Use dynamic stroke width
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 1.9;
    final Offset center = Offset(radius, radius);

    // Draw the background circle
    canvas.drawCircle(center, radius - strokeWidth / 2, backgroundPaint);

    // Draw the progress arc
    final double startAngle = -math.pi / 3; // Start from top
    final double sweepAngle = 2 * math.pi * progress; // Progress angle

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
