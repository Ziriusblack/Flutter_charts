import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';
import 'bars.dart';

const _category = 'Coordenadas';

final List<ChartEntry> basicCoordinates = [
  ChartEntry(
    id: 37,
    title: 'Histograma',
    description: 'Agrupa observaciones en intervalos de frecuencia.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateHistogram,
  ),
  ChartEntry(
    id: 38,
    title: 'Pareto',
    description: 'Ordena frecuencias y superpone su acumulado.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinatePareto,
  ),
  ChartEntry(
    id: 39,
    title: 'Pie',
    description: 'Distribución proporcional en coordenadas polares.',
    category: _category,
    level: ChartLevel.basic,
    builder: barPie,
  ),
  ChartEntry(
    id: 40,
    title: 'Donut',
    description: 'Pie con radio interior para mostrar el total.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateDonut,
  ),
  ChartEntry(
    id: 41,
    title: 'Rose chart',
    description: 'Sectores polares cuya longitud representa el valor.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateRose,
  ),
  ChartEntry(
    id: 42,
    title: 'Radar',
    description: 'Perfil cerrado de varias métricas en ejes radiales.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateRadar,
  ),
  ChartEntry(
    id: 43,
    title: 'Gauge',
    description: 'Indicador semicircular de progreso.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateGauge,
  ),
  ChartEntry(
    id: 44,
    title: 'Barras polares apiladas',
    description: 'Compara composición por sector angular.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateStackedPolar,
  ),
  ChartEntry(
    id: 45,
    title: 'Heatmap categórico',
    description: 'Cruza dos ejes categóricos en una cuadrícula de celdas.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateHeatmap,
  ),
  ChartEntry(
    id: 46,
    title: 'Barras de rango horizontal',
    description: 'Intervalos comparativos con orientación horizontal.',
    category: _category,
    level: ChartLevel.basic,
    builder: coordinateRangeHorizontal,
  ),
];

Variable<Map, String> _coordinateCategory(String key) =>
    Variable<Map, String>(accessor: (Map map) => map[key] as String);
Variable<Map, num> _coordinateValue() => Variable<Map, num>(
  accessor: (Map map) => map['value'] as num,
  scale: LinearScale(min: 0),
);

Chart _coordinateChart({
  required List<Map> data,
  String categoryKey = 'region',
  List<Mark>? marks,
  Coord? coord,
}) {
  final resolvedMarks = marks ?? [IntervalMark()];
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
      categoryKey: _coordinateCategory(categoryKey),
      'value': _coordinateValue(),
    },
    marks: resolvedMarks,
    coord: coord,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Widget coordinateHistogram() => Chart<Map>(
  data: histogramBins,
  variables: {
    'bin': Variable<Map, String>(accessor: (Map map) => map['bin'] as String),
    'count': Variable<Map, num>(
      accessor: (Map map) => map['count'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [IntervalMark(position: Varset('bin') * Varset('count'))],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget coordinatePareto() => Chart<Map>(
  data: paretoData,
  variables: {
    'category': Variable<Map, String>(
      accessor: (Map map) => map['category'] as String,
    ),
    'count': Variable<Map, num>(
      accessor: (Map map) => map['count'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
    'cumulative': Variable<Map, num>(
      accessor: (Map map) => map['cumulative'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    IntervalMark(position: Varset('category') * Varset('count')),
    LineMark(
      position: Varset('category') * Varset('cumulative'),
      shape: ShapeEncode(value: BasicLineShape()),
      color: ColorEncode(value: Colors.deepOrange),
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget coordinateDonut() => Chart<Map>(
  data: salesByGenre,
  variables: {
    'genre': Variable<Map, String>(
      accessor: (Map map) => map['genre'] as String,
    ),
    'sold': Variable<Map, num>(accessor: (Map map) => map['sold'] as num),
  },
  transforms: [Proportion(variable: 'sold', as: 'percent')],
  marks: [
    IntervalMark(
      position: Varset('percent') / Varset('genre'),
      modifiers: [StackModifier()],
      color: ColorEncode(variable: 'genre', values: Defaults.colors10),
    ),
  ],
  coord: PolarCoord(
    transposed: true,
    startRadius: 0.35,
    dimCount: 1,
    dimFill: 1.05,
  ),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);

Widget coordinateRose() => Chart<Map>(
  data: salesByGenre,
  variables: {
    'genre': Variable<Map, String>(
      accessor: (Map map) => map['genre'] as String,
    ),
    'sold': Variable<Map, num>(
      accessor: (Map map) => map['sold'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [
    IntervalMark(
      position: Varset('genre') * Varset('sold'),
      color: ColorEncode(variable: 'genre', values: Defaults.colors10),
    ),
  ],
  coord: PolarCoord(),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);

Widget coordinateRadar() => Chart<Map>(
  data: radarData,
  variables: {
    'axis': Variable<Map, String>(accessor: (Map map) => map['axis'] as String),
    'value': Variable<Map, num>(
      accessor: (Map map) => map['value'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    LineMark(
      position: Varset('axis') * Varset('value'),
      shape: ShapeEncode(value: BasicLineShape(loop: true)),
    ),
    PointMark(
      position: Varset('axis') * Varset('value'),
      shape: ShapeEncode(value: CircleShape()),
    ),
  ],
  coord: PolarCoord(),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);

Widget coordinateGauge() => Chart<Map>(
  data: const [
    {'type': 'Total', 'percent': 100},
    {'type': 'Complete', 'percent': 68},
  ],
  variables: {
    'type': Variable<Map, String>(accessor: (Map map) => map['type'] as String),
    'percent': Variable<Map, num>(
      accessor: (Map map) => map['percent'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    IntervalMark(
      position: Varset('type') * Varset('percent'),
      color: ColorEncode(
        variable: 'type',
        values: [Colors.grey, Colors.indigo],
      ),
    ),
  ],
  coord: PolarCoord(
    transposed: true,
    startAngle: 2.5,
    endAngle: 6.93,
    startRadius: 0.78,
    endRadius: 0.95,
  ),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);

Widget coordinateStackedPolar() => Chart<Map>(
  data: stackedSales,
  variables: {
    'genre': Variable<Map, String>(
      accessor: (Map map) => map['genre'] as String,
    ),
    'channel': Variable<Map, String>(
      accessor: (Map map) => map['channel'] as String,
    ),
    'value': Variable<Map, num>(
      accessor: (Map map) => map['value'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [
    IntervalMark(
      position: Varset('genre') * Varset('value') / Varset('channel'),
      modifiers: [StackModifier()],
      color: ColorEncode(variable: 'channel', values: Defaults.colors10),
    ),
  ],
  coord: PolarCoord(),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);

Widget coordinateHeatmap() => Chart<Map>(
  data: matrixData,
  variables: {
    'x': Variable<Map, String>(accessor: (Map map) => map['x'] as String),
    'y': Variable<Map, String>(accessor: (Map map) => map['y'] as String),
    'value': Variable<Map, num>(accessor: (Map map) => map['value'] as num),
  },
  marks: [
    PolygonMark(
      position: Varset('x') * Varset('y'),
      shape: ShapeEncode(value: HeatmapShape()),
      color: ColorEncode(variable: 'y', values: Defaults.colors10),
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget coordinateRangeHorizontal() => Chart<Map>(
  data: intervalData,
  variables: {
    'period': Variable<Map, String>(
      accessor: (Map map) => map['period'] as String,
    ),
    'min': Variable<Map, num>(
      accessor: (Map map) => map['min'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
    'max': Variable<Map, num>(
      accessor: (Map map) => map['max'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    IntervalMark(position: Varset('period') * (Varset('min') + Varset('max'))),
  ],
  coord: RectCoord(transposed: true),
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget coordinateBarsHorizontal() =>
    _coordinateChart(data: regionalSales, coord: RectCoord(transposed: true));
Widget coordinateBarsColored() => _coordinateChart(
  data: regionalSales,
  marks: [
    IntervalMark(
      color: ColorEncode(variable: 'region', values: Defaults.colors10),
    ),
  ],
);
Widget coordinateBarsLabels() => _coordinateChart(
  data: regionalSales,
  marks: [
    IntervalMark(
      label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
    ),
  ],
);
Widget coordinateBarsPoints() =>
    _coordinateChart(data: regionalSales, marks: [IntervalMark(), PointMark()]);
Widget coordinateLineHorizontal() => _coordinateChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [LineMark()],
  coord: RectCoord(transposed: true),
);
Widget coordinateAreaHorizontal() => _coordinateChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [AreaMark()],
  coord: RectCoord(transposed: true),
);
Widget coordinateRegions() =>
    _coordinateChart(data: regionalSales, marks: [LineMark()]);
Widget coordinateQuarters() =>
    _coordinateChart(data: quarterlySeries, categoryKey: 'quarter');
Widget coordinateGradient() => _coordinateChart(
  data: regionalSales,
  marks: [
    IntervalMark(
      gradient: GradientEncode(
        value: const LinearGradient(colors: [Colors.pink, Colors.deepOrange]),
      ),
    ),
  ],
);
Widget coordinateRounded() => _coordinateChart(
  data: regionalSales,
  marks: [
    IntervalMark(
      shape: ShapeEncode(
        value: RectShape(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
  ],
);
