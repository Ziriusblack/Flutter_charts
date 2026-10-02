import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';

const _trend = 'Tendencias combinadas';
const _compare = 'Comparativas combinadas';
const _composition = 'Composiciones';

final List<ChartEntry> advancedCombined = [
  ChartEntry(
    id: 1,
    title: 'Área y línea mensual',
    description: 'Área para contexto y línea para seguir la tendencia.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedAreaLine,
  ),
  ChartEntry(
    id: 2,
    title: 'Línea y puntos mensual',
    description: 'La línea muestra continuidad y los puntos cada observación.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedLinePoints,
  ),
  ChartEntry(
    id: 3,
    title: 'Área, línea y puntos',
    description: 'Tres capas para leer volumen, tendencia y valores.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedAreaLinePoints,
  ),
  ChartEntry(
    id: 4,
    title: 'Tendencia semanal coloreada',
    description: 'Línea y puntos con codificación cromática.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedWeeklyColor,
  ),
  ChartEntry(
    id: 5,
    title: 'Tendencia trimestral',
    description: 'Área y puntos para cuatro periodos.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedQuarterly,
  ),
  ChartEntry(
    id: 6,
    title: 'Tendencia horizontal',
    description: 'Composición de línea y puntos transpuesta.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedHorizontalTrend,
  ),
  ChartEntry(
    id: 7,
    title: 'Tendencia con etiquetas',
    description: 'Área, línea y etiquetas de valor.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedLabeledTrend,
  ),
  ChartEntry(
    id: 8,
    title: 'Tendencia con gradiente',
    description: 'Superficie y línea con gradientes complementarios.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedGradientTrend,
  ),
  ChartEntry(
    id: 9,
    title: 'Tendencia regional',
    description: 'Línea y puntos para comparar regiones.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedRegionalTrend,
  ),
  ChartEntry(
    id: 10,
    title: 'Tendencia de ventas',
    description: 'Barras, línea y puntos en un mismo gráfico.',
    category: _trend,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedSalesTrend,
  ),
  ChartEntry(
    id: 11,
    title: 'Barras y puntos regionales',
    description: 'Intervalos para magnitud y puntos para referencia.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedBarsPoints,
  ),
  ChartEntry(
    id: 12,
    title: 'Barras y línea regional',
    description: 'Comparación de columnas con una tendencia superpuesta.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedBarsLine,
  ),
  ChartEntry(
    id: 13,
    title: 'Barras coloreadas y línea',
    description: 'Categorías coloreadas con línea de lectura.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedColoredBarsLine,
  ),
  ChartEntry(
    id: 14,
    title: 'Barras etiquetadas y puntos',
    description: 'Valores directos y puntos de referencia.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedLabeledBarsPoints,
  ),
  ChartEntry(
    id: 15,
    title: 'Barras horizontales y puntos',
    description: 'Comparativa horizontal combinada.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedHorizontalBarsPoints,
  ),
  ChartEntry(
    id: 16,
    title: 'Barras con gradiente y línea',
    description: 'Gradiente en barras con una línea contrastante.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedGradientBarsLine,
  ),
  ChartEntry(
    id: 17,
    title: 'Barras de géneros y puntos',
    description: 'Ventas por género en dos capas.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedGenreBarsPoints,
  ),
  ChartEntry(
    id: 18,
    title: 'Áreas regionales y puntos',
    description: 'Área para el rango y puntos para comparar.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedRegionalAreaPoints,
  ),
  ChartEntry(
    id: 19,
    title: 'Trimestres en barras y área',
    description: 'Comparación trimestral con contexto de área.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedQuarterBarsArea,
  ),
  ChartEntry(
    id: 20,
    title: 'Comparativa de tres marcas',
    description: 'Intervalos, área y puntos para una lectura completa.',
    category: _compare,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedThreeComparison,
  ),
  ChartEntry(
    id: 21,
    title: 'Composición multicapas',
    description: 'Área, línea y puntos con color por periodo.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedMultiLayer,
  ),
  ChartEntry(
    id: 22,
    title: 'Composición transpuesta',
    description: 'Tres marcas en orientación horizontal.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedTransposedComposition,
  ),
  ChartEntry(
    id: 23,
    title: 'Composición etiquetada',
    description: 'Barras y línea con etiquetas de valor.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedLabeledComposition,
  ),
  ChartEntry(
    id: 24,
    title: 'Composición cromática',
    description: 'Área y puntos codificados por categoría.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedColorComposition,
  ),
  ChartEntry(
    id: 25,
    title: 'Composición con gradiente',
    description: 'Barras y área con gradientes.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedGradientComposition,
  ),
  ChartEntry(
    id: 26,
    title: 'Composición de ventas',
    description: 'Barras, línea y puntos sobre ventas mensuales.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedSalesComposition,
  ),
  ChartEntry(
    id: 27,
    title: 'Composición semanal',
    description: 'Área, barras y puntos para tráfico semanal.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedWeeklyComposition,
  ),
  ChartEntry(
    id: 28,
    title: 'Composición regional',
    description: 'Línea, área y puntos por región.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedRegionalComposition,
  ),
  ChartEntry(
    id: 29,
    title: 'Composición trimestral',
    description: 'Tres marcas para un resumen trimestral.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedQuarterComposition,
  ),
  ChartEntry(
    id: 30,
    title: 'Panel de cuatro lecturas',
    description: 'La composición final reúne cuatro capas visuales.',
    category: _composition,
    level: ChartLevel.advanced,
    isCombined: true,
    builder: advancedFourLayer,
  ),
];

Variable<Map, String> _advancedCategory(String key) =>
    Variable<Map, String>(accessor: (Map map) => map[key] as String);
Variable<Map, num> _advancedValue() => Variable<Map, num>(
  accessor: (Map map) => map['value'] as num,
  scale: LinearScale(min: 0),
);

Chart _advancedChart({
  required List<Map> data,
  required String categoryKey,
  required List<Mark> marks,
  Coord? coord,
}) {
  for (final currentMark in marks) {
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
      categoryKey: _advancedCategory(categoryKey),
      'value': _advancedValue(),
    },
    marks: marks,
    coord: coord,
    axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
  );
}

List<Mark> _areaLine() => [AreaMark(), LineMark()];
List<Mark> _linePoints() => [LineMark(), PointMark()];
List<Mark> _areaLinePoints() => [AreaMark(), LineMark(), PointMark()];
List<Mark> _barsPoints() => [IntervalMark(), PointMark()];
List<Mark> _barsLine() => [IntervalMark(), LineMark()];

Widget advancedAreaLine() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: _areaLine(),
);
Widget advancedLinePoints() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: _linePoints(),
);
Widget advancedAreaLinePoints() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: _areaLinePoints(),
);
Widget advancedWeeklyColor() => _advancedChart(
  data: weeklyTraffic,
  categoryKey: 'day',
  marks: [
    LineMark(
      color: ColorEncode(variable: 'day', values: Defaults.colors10),
    ),
    PointMark(),
  ],
);
Widget advancedQuarterly() => _advancedChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  marks: [AreaMark(), PointMark()],
);
Widget advancedHorizontalTrend() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: _linePoints(),
  coord: RectCoord(transposed: true),
);
Widget advancedLabeledTrend() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [
    AreaMark(),
    LineMark(
      label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
    ),
  ],
);
Widget advancedGradientTrend() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [
    AreaMark(
      gradient: GradientEncode(
        value: const LinearGradient(colors: [Colors.teal, Colors.lightBlue]),
      ),
    ),
    LineMark(
      gradient: GradientEncode(
        value: const LinearGradient(colors: [Colors.deepOrange, Colors.red]),
      ),
    ),
  ],
);
Widget advancedRegionalTrend() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: _linePoints(),
);
Widget advancedSalesTrend() => _advancedChart(
  data: salesByGenre,
  categoryKey: 'genre',
  marks: [IntervalMark(), LineMark(), PointMark()],
);
Widget advancedBarsPoints() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: _barsPoints(),
);
Widget advancedBarsLine() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: _barsLine(),
);
Widget advancedColoredBarsLine() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: [
    IntervalMark(
      color: ColorEncode(variable: 'region', values: Defaults.colors10),
    ),
    LineMark(),
  ],
);
Widget advancedLabeledBarsPoints() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: [
    IntervalMark(
      label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
    ),
    PointMark(),
  ],
);
Widget advancedHorizontalBarsPoints() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: _barsPoints(),
  coord: RectCoord(transposed: true),
);
Widget advancedGradientBarsLine() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: [
    IntervalMark(
      gradient: GradientEncode(
        value: const LinearGradient(colors: [Colors.pink, Colors.deepOrange]),
      ),
    ),
    LineMark(),
  ],
);
Widget advancedGenreBarsPoints() => _advancedChart(
  data: salesByGenre,
  categoryKey: 'genre',
  marks: _barsPoints(),
);
Widget advancedRegionalAreaPoints() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: [AreaMark(), PointMark()],
);
Widget advancedQuarterBarsArea() => _advancedChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  marks: [IntervalMark(), AreaMark()],
);
Widget advancedThreeComparison() => _advancedChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  marks: [IntervalMark(), AreaMark(), PointMark()],
);
Widget advancedMultiLayer() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [
    AreaMark(
      color: ColorEncode(variable: 'month', values: Defaults.colors10),
    ),
    LineMark(),
    PointMark(),
  ],
);
Widget advancedTransposedComposition() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: _areaLinePoints(),
  coord: RectCoord(transposed: true),
);
Widget advancedLabeledComposition() => _advancedChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  marks: [
    IntervalMark(),
    LineMark(
      label: LabelEncode(encoder: (tuple) => Label(tuple['value'].toString())),
    ),
  ],
);
Widget advancedColorComposition() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [
    AreaMark(
      color: ColorEncode(variable: 'month', values: Defaults.colors10),
    ),
    PointMark(
      color: ColorEncode(variable: 'month', values: Defaults.colors10),
    ),
  ],
);
Widget advancedGradientComposition() => _advancedChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  marks: [
    IntervalMark(
      gradient: GradientEncode(
        value: const LinearGradient(colors: [Colors.indigo, Colors.cyan]),
      ),
    ),
    AreaMark(
      gradient: GradientEncode(
        value: const LinearGradient(colors: [Colors.orange, Colors.amber]),
      ),
    ),
  ],
);
Widget advancedSalesComposition() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [IntervalMark(), LineMark(), PointMark()],
);
Widget advancedWeeklyComposition() => _advancedChart(
  data: weeklyTraffic,
  categoryKey: 'day',
  marks: [AreaMark(), IntervalMark(), PointMark()],
);
Widget advancedRegionalComposition() => _advancedChart(
  data: regionalSales,
  categoryKey: 'region',
  marks: _areaLinePoints(),
);
Widget advancedQuarterComposition() => _advancedChart(
  data: quarterlySeries,
  categoryKey: 'quarter',
  marks: _areaLinePoints(),
);
Widget advancedFourLayer() => _advancedChart(
  data: monthlySales,
  categoryKey: 'month',
  marks: [AreaMark(), IntervalMark(), LineMark(), PointMark()],
);
