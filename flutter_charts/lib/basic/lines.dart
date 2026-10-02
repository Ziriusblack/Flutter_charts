import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';

const _category = 'Líneas';

final List<ChartEntry> basicLines = [
  ChartEntry(
    id: 7,
    title: 'Línea temporal',
    description: 'Evolución mensual con una línea continua.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineMonthly,
  ),
  ChartEntry(
    id: 8,
    title: 'Líneas comparativas',
    description: 'Compara dos series en el mismo eje temporal.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineMultiSeries,
  ),
  ChartEntry(
    id: 9,
    title: 'Línea escalonada',
    description: 'Muestra cambios por saltos con BasicLineShape stepped.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineStepped,
  ),
  ChartEntry(
    id: 10,
    title: 'Línea suavizada',
    description: 'Usa una spline para enfatizar la tendencia general.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineSmooth,
  ),
  ChartEntry(
    id: 11,
    title: 'Línea acumulada',
    description: 'Acumula el resultado de cada periodo.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineCumulative,
  ),
  ChartEntry(
    id: 12,
    title: 'Líneas indexadas',
    description: 'Compara crecimiento relativo tomando 100 como base.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineIndexed,
  ),
  ChartEntry(
    id: 13,
    title: 'Línea de crecimiento',
    description: 'Distingue incrementos y descensos alrededor de cero.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineGrowth,
  ),
  ChartEntry(
    id: 14,
    title: 'Perfil regional',
    description: 'Conecta el perfil de valor entre regiones.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineCompact,
  ),
  ChartEntry(
    id: 15,
    title: 'Línea polar cerrada',
    description: 'Cierra una serie alrededor de una coordenada polar.',
    category: _category,
    level: ChartLevel.basic,
    builder: linePolar,
  ),
  ChartEntry(
    id: 16,
    title: 'Línea horizontal',
    description: 'Invierte los ejes para leer la serie en horizontal.',
    category: _category,
    level: ChartLevel.basic,
    builder: lineHorizontal,
  ),
];

Variable<Map, String> _categoryVariable(String key) =>
    Variable<Map, String>(accessor: (Map map) => map[key] as String);

Variable<Map, num> _valueVariable({double min = 0}) => Variable<Map, num>(
  accessor: (Map map) => map['value'] as num,
  scale: LinearScale(min: min),
);

Chart _lineChart({
  required List<Map> data,
  Mark? mark,
  Coord? coord,
  String categoryKey = 'month',
  List<Mark>? marks,
  double minValue = 0,
}) {
  final resolvedMarks = marks ?? [mark ?? LineMark()];
  for (final currentMark in resolvedMarks) {
    currentMark.position ??= Varset(categoryKey) * Varset('value');
    if (currentMark is LineMark) {
      currentMark.shape ??= ShapeEncode(value: BasicLineShape());
    } else if (currentMark is AreaMark) {
      currentMark.shape ??= ShapeEncode(value: BasicAreaShape());
    } else if (currentMark is PointMark) {
      currentMark.shape ??= ShapeEncode(value: CircleShape());
    }
  }

  return Chart<Map>(
    data: data,
    variables: {
      categoryKey: _categoryVariable(categoryKey),
      'value': _valueVariable(min: minValue),
    },
    marks: resolvedMarks,
    coord: coord,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Chart _lineSeriesChart({required List<Map> data, Coord? coord}) {
  final marks = [
    LineMark(
      position: Varset('month') * Varset('value') / Varset('series'),
      shape: ShapeEncode(value: BasicLineShape()),
      color: ColorEncode(variable: 'series', values: Defaults.colors10),
    ),
  ];
  return Chart<Map>(
    data: data,
    variables: {
      'month': _categoryVariable('month'),
      'series': Variable<Map, String>(
        accessor: (Map map) => map['series'] as String,
      ),
      'value': _valueVariable(),
    },
    marks: marks,
    coord: coord,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Widget lineMonthly() => _lineChart(data: monthlySales);

Widget lineMultiSeries() => _lineSeriesChart(data: multiSeries);

Widget lineStepped() => _lineChart(
  data: monthlySales,
  mark: LineMark(shape: ShapeEncode(value: BasicLineShape(stepped: true))),
);

Widget lineWithPoints() =>
    _lineChart(data: monthlySales, marks: [LineMark(), PointMark()]);

Widget lineSmooth() => _lineChart(
  data: monthlySales,
  mark: LineMark(shape: ShapeEncode(value: BasicLineShape(smooth: true))),
);

Widget lineCumulative() => _lineChart(data: cumulativeSales);

Widget lineIndexed() => _lineSeriesChart(data: indexedSales);

Widget lineGrowth() => _lineChart(data: growthSales, minValue: -60);

Widget lineColored() => _lineChart(
  data: monthlySales,
  mark: LineMark(
    color: ColorEncode(variable: 'month', values: Defaults.colors10),
  ),
);

Widget lineLabels() => _lineChart(
  data: monthlySales,
  mark: LineMark(
    label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
  ),
);

Widget lineHorizontal() =>
    _lineChart(data: monthlySales, coord: RectCoord(transposed: true));

Widget lineWeekly() => _lineChart(data: weeklyTraffic, categoryKey: 'day');

Widget lineQuarterly() =>
    _lineChart(data: quarterlySeries, categoryKey: 'quarter');

Widget lineGradient() => _lineChart(
  data: monthlySales,
  mark: LineMark(
    gradient: GradientEncode(
      value: const LinearGradient(colors: [Colors.indigo, Colors.teal]),
    ),
  ),
);

Widget lineCompact() => _lineChart(data: regionalSales, categoryKey: 'region');

Widget linePolar() => _lineChart(
  data: monthlySales,
  coord: PolarCoord(),
  mark: LineMark(shape: ShapeEncode(value: BasicLineShape(loop: true))),
);
