import 'package:flutter/material.dart';
import 'dart:math';

class WindRose extends StatelessWidget {
  final List<double> values;

  const WindRose({required this.values});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WindRosePainter(values: values),
    );
  }
}

class WindRosePainter extends CustomPainter {
  final List<double> values;

  WindRosePainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Paint borderPaint = Paint()
      ..color = const Color.fromARGB(255, 158, 1, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Paint fillPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 0, 107).withOpacity(0.3) // Задайте цвет заливки с некоторой непрозрачностью
      ..style = PaintingStyle.fill;

    final Paint pointPaint = Paint()
      ..color = const Color.fromARGB(255, 158, 1, 255)
      ..style = PaintingStyle.fill;

    final double maxValue = values.reduce((value, element) => value > element ? value : element);

    final Path fillPath = Path();

    for (int i = 0; i < 8; i++) {
      final double angle = i * (pi / 4);
      final double normalizedValue = values[i] / maxValue;
      final double pointX = centerX + normalizedValue * radius * cos(angle);
      final double pointY = centerY + normalizedValue * radius * sin(angle);

      if (i == 0) {
        fillPath.moveTo(pointX, pointY);
      }

      canvas.drawCircle(Offset(pointX, pointY), 2.0, pointPaint);

      if (i < 7) {
        final double nextAngle = (i + 1) * (pi / 4);
        final double nextNormalizedValue = values[i + 1] / maxValue;
        final double nextPointX = centerX + nextNormalizedValue * radius * cos(nextAngle);
        final double nextPointY = centerY + nextNormalizedValue * radius * sin(nextAngle);

        fillPath.quadraticBezierTo(
          pointX + (nextPointX - pointX) / 2, pointY,
          nextPointX, nextPointY,
        );

        fillPath.lineTo(nextPointX, nextPointY);
      }
    }

    // Соединяем первую и последнюю точки линией
    final double firstAngle = 0;
    final double firstNormalizedValue = values[0] / maxValue;
    final double firstPointX = centerX + firstNormalizedValue * radius * cos(firstAngle);
    final double firstPointY = centerY + firstNormalizedValue * radius * sin(firstAngle);

    fillPath.lineTo(firstPointX, firstPointY);

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(fillPath, borderPaint);

    // Рисуем розу ветров
    for (double angle = 0; angle < 2 * pi; angle += pi / 4) {
      final double x = centerX + (radius+10) * cos(angle);
      final double y = centerY + (radius+10) * sin(angle);
      final Offset start = Offset(centerX, centerY);
      final Offset end = Offset(x, y);
      canvas.drawLine(start, end, paint);
    }

    // Рисуем окружности, представляющие уровни розы ветров
    final Paint circlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (int i = 1; i <= 5; i++) {
      canvas.drawCircle(
        Offset(centerX, centerY),
        radius * (i / 5),
        circlePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}