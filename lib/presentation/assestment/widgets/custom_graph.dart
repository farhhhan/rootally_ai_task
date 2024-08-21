import 'dart:ui';

import 'package:flutter/material.dart';

class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Paint pointPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final double xMax = size.width;
    final double yMax = size.height;

    // Define main points
    final List<Offset> points = [
      Offset(xMax * 0.09, yMax * 0.67), // Point 1
      Offset(xMax * 0.25, yMax * 0.63), // Point 2
      Offset(xMax * 0.34, yMax * 0.53), // Point 3
      Offset(xMax * 0.55, yMax * 0.46), // Point 4
      Offset(xMax * 0.62, yMax * 0.51),
      Offset(xMax * 0.65, yMax * 0.53), // Point 5
    ];

    // Define branch points for each main branch
    final Map<int, List<Offset>> branches = {
      2: [
        // Branch from point 3
        Offset(xMax * 0.45, yMax * 0.76), // Branch point 1
        Offset(xMax * 0.26, yMax * 0.7),  // Branch point 2
      ],
      3: [
        // Branch from point 4
        Offset(xMax * 0.54, yMax * 0.63), // Branch point 1
        Offset(xMax * 0.54, yMax * 0.8),  // Branch point 2
      ],
      4: [
        // Branch from point 4 (New)
        Offset(xMax * 0.65, yMax * 0.53), // Branch point 1
        Offset(xMax * 0.72, yMax * 0.47), // Branch point 2
      ],
      5: [
        // Branch from point 5
        Offset(xMax * 0.66, yMax * 0.63), // Branch point 1
        Offset(xMax * 0.64, yMax * 0.8),  // Branch point 2
      ],
    };

    // Draw main lines between points
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], linePaint);
    }

    // Draw branches from specified points
    branches.forEach((pointIndex, branchPoints) {
      final mainPoint = points[pointIndex];
      for (int i = 0; i < branchPoints.length - 1; i++) {
        canvas.drawLine(branchPoints[i], branchPoints[i + 1], linePaint);
        canvas.drawLine(mainPoint, branchPoints[i], linePaint); // Connect branch to main point
      }
    });

    // Draw main points
    for (var point in points) {
      canvas.drawCircle(point, 3.0, pointPaint);
    }

    // Draw branch points
    branches.values.expand((branchPoints) => branchPoints).forEach((branchPoint) {
      canvas.drawCircle(branchPoint, 3.0, pointPaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
