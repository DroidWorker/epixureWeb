import 'dart:math';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final Map<String, double> data;

  CustomLineChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Container(
        padding: EdgeInsets.all(16.0),
        child: CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxWidth*0.35), // Задайте размер графика
          painter: LineChartPainter(data),
        ),
      );
    });
  }
}

class LineChartPainter extends CustomPainter {
  final Map<String, double> data;

  LineChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final double paddingTop = 20.0;
    final double paddingBottom = 20.0;
    final double paddingLeft = 20.0;
    final double paddingRight = 20.0;

    final double chartWidth = size.width - paddingLeft - paddingRight;
    final double chartHeight = size.height - paddingTop - paddingBottom;

    final double maxValue = data.values.reduce(max);
    final double xInterval = chartWidth / (data.length - 1);
    final double yInterval = chartHeight / maxValue;

    // Рисуем горизонтальные линии сетки
    for (double i = 0; i <= maxValue; i += maxValue / 4) {
      final double y = size.height - paddingBottom - i * yInterval;
      canvas.drawLine(Offset(paddingLeft, y), Offset(size.width - paddingRight, y), Paint()..color = Colors.grey);
      // Подписываем значения сетки
      TextSpan span = TextSpan(
        text: i.toStringAsFixed(1),
        style: TextStyle(color: Colors.black, fontSize: 10),
      );
      TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(paddingLeft - tp.width - 5, y - tp.height / 2));
    }

    // Рисуем сглаженный график
    final Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Path path = Path();
    for (int i = 0; i < data.length; i++) {
      final double x = paddingLeft + i * xInterval;
      final double y = size.height - paddingBottom - data.values.elementAt(i) * yInterval;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Используем кривую Безье с дополнительными контрольными точками
        final double prevX = paddingLeft + (i - 1) * xInterval;
        final double prevY = size.height - paddingBottom - data.values.elementAt(i - 1) * yInterval;
        final double cX1 = prevX + xInterval / 2;
        final double cY1 = prevY;
        final double cX2 = x - xInterval / 2;
        final double cY2 = y;
        final double endX = x;
        final double endY = y;

        path.cubicTo(cX1, cY1, cX2, cY2, endX, endY);
      }
    }

    canvas.drawPath(path, linePaint);

    // Подписываем значения оси X
    for (int i = 0; i < data.length; i++) {
      final double x = paddingLeft + i * xInterval;
      TextSpan span = TextSpan(
        text: data.keys.elementAt(i),
        style: TextStyle(color: Colors.black, fontSize: 10),
      );
      TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(x - tp.width / 2, size.height - paddingBottom + 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}