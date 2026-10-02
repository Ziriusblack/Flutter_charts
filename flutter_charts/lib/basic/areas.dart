import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';

const _category = 'Áreas';

final List<ChartEntry> basicAreas = [
  ChartEntry(
    id: 17,
    title: 'Área temporal',
    description: 'Superficie bajo una tendencia mensual.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaMonthly,
  ),
  ChartEntry(
    id: 18,
    title: 'Áreas apiladas',
    description: 'Compara la contribución de dos series a un total.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaStacked,
  ),
  ChartEntry(
    id: 19,
    title: 'Área normalizada',
    description: 'Convierte cada periodo en proporciones comparables.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaNormalized,
  ),
  ChartEntry(
    id: 20,
    title: 'Área de rango',
    description: 'Muestra una banda entre un límite inferior y superior.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaRange,
  ),
  ChartEntry(
    id: 21,
    title: 'Banda de confianza',
    description: 'Combina intervalo de confianza y estimación central.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaConfidence,
  ),
  ChartEntry(
    id: 22,
    title: 'Área acumulada',
    description: 'Superficie basada en valores acumulados.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaCumulative,
  ),
  ChartEntry(
    id: 23,
    title: 'Área divergente',
    description: 'Separa contribuciones positivas y negativas.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaDivergent,
  ),
  ChartEntry(
    id: 24,
    title: 'Área escalonada',
    description: 'Representa cambios por intervalos discretos.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaStepped,
  ),
  ChartEntry(
    id: 25,
    title: 'Área polar',
    description: 'Distribuye valores alrededor de un eje angular.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaPolar,
  ),
  ChartEntry(
    id: 26,
    title: 'Área con observaciones',
    description: 'Superficie y puntos para contrastar tendencia y datos.',
    category: _category,
    level: ChartLevel.basic,
    builder: areaWithPoints,
  ),
];

Variable<Map, String> _areaCategory(String key) =>
    Variable<Map, String>(accessor: (Map map) => map[key] as String);

Variable<Map, num> _areaValue() => Variable<Map, num>(
  accessor: (Map map) => map['value'] as num,
  scale: LinearScale(min: 0),
);

Chart _areaChart({
  required List<Map> data,
  String categoryKey = 'month',
  Mark? mark,
  List<Mark>? marks,
  Coord? coord,
}) {
  final resolvedMarks = marks ?? [mark ?? AreaMark()];
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
    variables: {categoryKey: _areaCategory(categoryKey), 'value': _areaValue()},
    marks: resolvedMarks,
    coord: coord,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Chart _areaSeriesChart({required List<Map> data, bool normalized = false}) {
  final valueKey = normalized ? 'percent' : 'value';
  final marks = [
    AreaMark(
      position: Varset('month') * Varset(valueKey) / Varset('series'),
      color: ColorEncode(variable: 'series', values: Defaults.colors10),
      modifiers: [StackModifier()],
    ),
  ];
  return Chart<Map>(
    data: data,
    variables: {
      'month': _areaCategory('month'),
      'series': Variable<Map, String>(
        accessor: (Map map) => map['series'] as String,
      ),
      'value': _areaValue(),
      if (normalized)
        'percent': Variable<Map, num>(
          accessor: (Map map) => map['value'] as num,
          scale: LinearScale(min: 0, max: 1),
        ),
    },
    transforms: normalized
        ? [Proportion(variable: 'value', as: 'percent')]
        : null,
    marks: marks,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

Widget areaStacked() => _areaSeriesChart(data: multiSeries);

Widget areaNormalized() =>
    _areaSeriesChart(data: multiSeries, normalized: true);

Widget areaRange() => Chart<Map>(
  data: intervalData,
  variables: {
    'period': _areaCategory('period'),
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
    AreaMark(
      position: Varset('period') * (Varset('min') + Varset('max')),
      shape: ShapeEncode(value: BasicAreaShape()),
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget areaConfidence() => Chart<Map>(
  data: confidenceData,
  variables: {
    'month': _areaCategory('month'),
    'estimate': Variable<Map, num>(
      accessor: (Map map) => map['estimate'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
    'lower': Variable<Map, num>(
      accessor: (Map map) => map['lower'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
    'upper': Variable<Map, num>(
      accessor: (Map map) => map['upper'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    AreaMark(position: Varset('month') * (Varset('lower') + Varset('upper'))),
    LineMark(
      position: Varset('month') * Varset('estimate'),
      shape: ShapeEncode(value: BasicLineShape()),
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget areaCumulative() => _areaChart(data: cumulativeSales);

Widget areaDivergent() => Chart<Map>(
  data: divergentData,
  variables: {
    'month': _areaCategory('month'),
    'positive': Variable<Map, num>(
      accessor: (Map map) => map['positive'] as num,
      scale: LinearScale(min: -50, max: 100),
    ),
    'negative': Variable<Map, num>(
      accessor: (Map map) => map['negative'] as num,
      scale: LinearScale(min: -50, max: 100),
    ),
  },
  marks: [
    AreaMark(
      position: Varset('month') * Varset('positive'),
      color: ColorEncode(value: Colors.teal),
    ),
    AreaMark(
      position: Varset('month') * Varset('negative'),
      color: ColorEncode(value: Colors.deepOrange),
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget areaStepped() => _areaChart(
  data: monthlySales,
  mark: AreaMark(shape: ShapeEncode(value: BasicAreaShape(stepped: true))),
);

Widget areaPolar() => _areaChart(data: monthlySales, coord: PolarCoord());

Widget areaMonthly() => _areaChart(data: monthlySales);
Widget areaWeekly() => _areaChart(data: weeklyTraffic, categoryKey: 'day');
Widget areaColored() => _areaChart(
  data: monthlySales,
  mark: AreaMark(
    color: ColorEncode(variable: 'month', values: Defaults.colors10),
  ),
);
Widget areaGradient() => _areaChart(
  data: monthlySales,
  mark: AreaMark(
    gradient: GradientEncode(
      value: const LinearGradient(colors: [Colors.teal, Colors.lightBlue]),
    ),
  ),
);
Widget areaLabels() => _areaChart(
  data: monthlySales,
  mark: AreaMark(
    label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
  ),
);
Widget areaHorizontal() => _areaChart(
  data: regionalSales,
  categoryKey: 'region',
  coord: RectCoord(transposed: true),
);
Widget areaQuarterly() =>
    _areaChart(data: quarterlySeries, categoryKey: 'quarter');
Widget areaRegional() => _areaChart(data: regionalSales, categoryKey: 'region');
Widget areaWithPoints() =>
    _areaChart(data: monthlySales, marks: [AreaMark(), PointMark()]);
Widget areaReference() => _areaChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  mark: AreaMark(size: SizeEncode(value: 2)),
);
