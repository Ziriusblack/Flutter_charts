import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';

const _category = 'Codificaciones';

final List<ChartEntry> basicEncodings = [
  ChartEntry(
    id: 47,
    title: 'Tamaño por valor',
    description: 'El tamaño de cada punto representa su valor.',
    category: _category,
    level: ChartLevel.basic,
    builder: encodingSize,
  ),
  ChartEntry(
    id: 48,
    title: 'Color y etiquetas',
    description: 'Color categórico combinado con etiquetas.',
    category: _category,
    level: ChartLevel.basic,
    builder: encodingColorLabels,
  ),
  ChartEntry(
    id: 49,
    title: 'Gradiente de área',
    description: 'Gradiente aplicado a una superficie temporal.',
    category: _category,
    level: ChartLevel.basic,
    builder: encodingGradientArea,
  ),
  ChartEntry(
    id: 50,
    title: 'Tres marcas',
    description: 'Intervalos, línea y puntos en un mismo lienzo.',
    category: _category,
    level: ChartLevel.basic,
    builder: encodingThreeMarks,
  ),
];

Variable<Map, String> _encodingCategory() =>
    Variable<Map, String>(accessor: (Map map) => map['month'] as String);
Variable<Map, num> _encodingValue() => Variable<Map, num>(
  accessor: (Map map) => map['value'] as num,
  scale: LinearScale(min: 0),
);

Chart _encodingChart(List<Mark> marks) {
  for (final currentMark in marks) {
    currentMark.position ??= Varset('month') * Varset('value');
    if (currentMark is LineMark) {
      currentMark.shape ??= ShapeEncode(value: BasicLineShape());
    } else if (currentMark is AreaMark) {
      currentMark.shape ??= ShapeEncode(value: BasicAreaShape());
    } else if (currentMark is PointMark) {
      currentMark.shape ??= ShapeEncode(value: CircleShape());
    }
  }

  return Chart<Map>(
    data: monthlySales,
    variables: {'month': _encodingCategory(), 'value': _encodingValue()},
    marks: marks,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Widget encodingSize() => _encodingChart([
  PointMark(
    size: SizeEncode(variable: 'value', values: [4, 10]),
  ),
]);
Widget encodingColorLabels() => _encodingChart([
  PointMark(
    color: ColorEncode(variable: 'month', values: Defaults.colors10),
    label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
  ),
]);
Widget encodingGradientArea() => _encodingChart([
  AreaMark(
    gradient: GradientEncode(
      value: const LinearGradient(colors: [Colors.cyan, Colors.blueGrey]),
    ),
  ),
]);
Widget encodingThreeMarks() =>
    _encodingChart([IntervalMark(), LineMark(), PointMark()]);
