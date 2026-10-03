import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';

const _category = 'Puntos';

final List<ChartEntry> basicPoints = [
  ChartEntry(
    id: 27,
    title: 'Dispersión X/Y',
    description: 'Relaciona dos medidas numéricas en un plano cartesiano.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsScatter,
  ),
  ChartEntry(
    id: 28,
    title: 'Dispersión por grupos',
    description: 'Separa observaciones por grupo sin cambiar sus coordenadas.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsGroupedScatter,
  ),
  ChartEntry(
    id: 29,
    title: 'Gráfico de burbujas',
    description: 'Codifica una tercera medida usando el tamaño del punto.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsBubble,
  ),
  ChartEntry(
    id: 30,
    title: 'Dot plot',
    description: 'Distribuye valores puntuales sobre categorías.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsDotPlot,
  ),
  ChartEntry(
    id: 31,
    title: 'Strip plot',
    description: 'Muestra múltiples observaciones por categoría con jitter.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsStrip,
  ),
  ChartEntry(
    id: 32,
    title: 'Dispersión temporal',
    description: 'Observaciones secuenciales representadas como puntos.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsTime,
  ),
  ChartEntry(
    id: 33,
    title: 'Matriz de puntos',
    description: 'Cruza dos variables categóricas con una medida puntual.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsMatrix,
  ),
  ChartEntry(
    id: 34,
    title: 'Puntos con forma',
    description: 'Usa círculos y cuadrados para distinguir grupos.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsShapes,
  ),
  ChartEntry(
    id: 35,
    title: 'Dispersión polar',
    description: 'Coloca puntos usando ángulo y radio.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsPolar,
  ),
  ChartEntry(
    id: 36,
    title: 'Dispersión con etiquetas',
    description: 'Identifica observaciones individuales con sus valores.',
    category: _category,
    level: ChartLevel.basic,
    builder: pointsLabels,
  ),
];

Variable<Map, String> _pointCategory(String key) =>
    Variable<Map, String>(accessor: (Map map) => map[key] as String);

Variable<Map, num> _pointValue() => Variable<Map, num>(
  accessor: (Map map) => map['value'] as num,
  scale: LinearScale(min: 0),
);

Chart _pointChart({
  required List<Map> data,
  String categoryKey = 'month',
  Mark? mark,
  List<Mark>? marks,
  Coord? coord,
}) {
  final resolvedMarks = marks ?? [mark ?? PointMark()];
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
      categoryKey: _pointCategory(categoryKey),
      'value': _pointValue(),
    },
    marks: resolvedMarks,
    coord: coord,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Chart _scatterChart({required List<Map> data, PointMark? mark}) {
  final resolvedMark = mark ?? PointMark();
  resolvedMark.position ??= Varset('x') * Varset('y');
  resolvedMark.shape ??= ShapeEncode(value: CircleShape());
  return Chart<Map>(
    data: data,
    variables: {
      'x': Variable<Map, num>(
        accessor: (Map map) => map['x'] as num,
        scale: LinearScale(min: 0, max: 80),
      ),
      'y': Variable<Map, num>(
        accessor: (Map map) => map['y'] as num,
        scale: LinearScale(min: 0, max: 90),
      ),
      'group': Variable<Map, String>(
        accessor: (Map map) => map['group'] as String,
      ),
      'weight': Variable<Map, num>(accessor: (Map map) => map['weight'] as num),
    },
    marks: [resolvedMark],
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Widget pointsScatter() => _scatterChart(data: scatterData);

Widget pointsGroupedScatter() => _scatterChart(
  data: scatterData,
  mark: PointMark(
    color: ColorEncode(variable: 'group', values: Defaults.colors10),
  ),
);

Widget pointsBubble() => _scatterChart(
  data: scatterData,
  mark: PointMark(
    size: SizeEncode(variable: 'weight', values: [5, 18]),
  ),
);

Widget pointsDotPlot() => _pointChart(data: stripData, categoryKey: 'category');

Widget pointsStrip() => Chart<Map>(
  data: stripData,
  variables: {
    'category': Variable<Map, String>(
      accessor: (Map map) => map['category'] as String,
    ),
    'value': Variable<Map, num>(
      accessor: (Map map) => map['value'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    PointMark(
      position: Varset('category') * Varset('value'),
      shape: ShapeEncode(value: CircleShape(hollow: true)),
      modifiers: [JitterModifier(ratio: 0.35)],
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget pointsTime() => _pointChart(data: monthlySales);

Widget pointsMatrix() => Chart<Map>(
  data: matrixData,
  variables: {
    'x': Variable<Map, String>(accessor: (Map map) => map['x'] as String),
    'y': Variable<Map, String>(accessor: (Map map) => map['y'] as String),
    'value': Variable<Map, num>(accessor: (Map map) => map['value'] as num),
  },
  marks: [
    PointMark(
      position: Varset('x') * Varset('y'),
      size: SizeEncode(variable: 'value', values: [5, 18]),
      color: ColorEncode(variable: 'y', values: Defaults.colors10),
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget pointsShapes() => _scatterChart(
  data: scatterData,
  mark: PointMark(
    shape: ShapeEncode(
      variable: 'group',
      values: [CircleShape(), SquareShape()],
    ),
    color: ColorEncode(variable: 'group', values: Defaults.colors10),
  ),
);

Widget pointsPolar() => Chart<Map>(
  data: scatterData,
  variables: {
    'angle': Variable<Map, num>(
      accessor: (Map map) => map['x'] as num,
      scale: LinearScale(min: 0, max: 80),
    ),
    'radius': Variable<Map, num>(
      accessor: (Map map) => map['y'] as num,
      scale: LinearScale(min: 0, max: 90),
    ),
  },
  marks: [
    PointMark(
      position: Varset('angle') * Varset('radius'),
      shape: ShapeEncode(value: CircleShape()),
    ),
  ],
  coord: PolarCoord(),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);

Widget pointsMonthly() => _pointChart(data: monthlySales);
Widget pointsWeekly() => _pointChart(data: weeklyTraffic, categoryKey: 'day');
Widget pointsRegional() =>
    _pointChart(data: regionalSales, categoryKey: 'region');
Widget pointsColored() => _pointChart(
  data: monthlySales,
  mark: PointMark(
    color: ColorEncode(variable: 'month', values: Defaults.colors10),
  ),
);
Widget pointsLarge() => _pointChart(
  data: monthlySales,
  mark: PointMark(size: SizeEncode(value: 8)),
);
Widget pointsLabels() => _pointChart(
  data: monthlySales,
  mark: PointMark(
    label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
  ),
);
Widget pointsGradient() => _pointChart(
  data: monthlySales,
  mark: PointMark(
    gradient: GradientEncode(
      value: const LinearGradient(colors: [Colors.orange, Colors.red]),
    ),
  ),
);
Widget pointsHorizontal() => _pointChart(
  data: regionalSales,
  categoryKey: 'region',
  coord: RectCoord(transposed: true),
);
Widget pointsQuarterly() =>
    _pointChart(data: quarterlySeries, categoryKey: 'quarter');
Widget pointsOnLine() =>
    _pointChart(data: monthlySales, marks: [LineMark(), PointMark()]);
