import 'dart:math' as math;

import 'package:flutter/material.dart';

class DashRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  const DashRectPainter({
    this.strokeWidth = 5.0,
    this.color = Colors.black,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path topPath = getDashedPath(
      a: math.Point<double>(0, 0),
      b: math.Point<double>(x, 0),
      gap: gap,
    );

    Path rightPath = getDashedPath(
      a: math.Point<double>(x, 0),
      b: math.Point<double>(x, y),
      gap: gap,
    );

    Path bottomPath = getDashedPath(
      a: math.Point<double>(0, y),
      b: math.Point<double>(x, y),
      gap: gap,
    );

    Path leftPath = getDashedPath(
      a: math.Point<double>(0, 0),
      b: math.Point<double>(0.001, y),
      gap: gap,
    );

    canvas
      ..drawPath(topPath, dashedPaint)
      ..drawPath(rightPath, dashedPaint)
      ..drawPath(bottomPath, dashedPaint)
      ..drawPath(leftPath, dashedPaint);
  }

  Path getDashedPath({
    required math.Point<double> a,
    required math.Point<double> b,
    required double gap,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path()..moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point<double> currentPoint = math.Point<double>(a.x, a.y);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x.toDouble(), currentPoint.y.toDouble())
          : path.moveTo(currentPoint.x.toDouble(), currentPoint.y.toDouble());
      shouldDraw = !shouldDraw;
      currentPoint = math.Point<double>(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
