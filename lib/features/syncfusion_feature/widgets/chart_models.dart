import 'dart:ui';

class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.y,
    this.secondY,
    this.thirdY,
    this.fourthY,
    this.color,
  });

  final dynamic x;
  final num y;
  final num? secondY;
  final num? thirdY;
  final num? fourthY;
  final Color? color;
}