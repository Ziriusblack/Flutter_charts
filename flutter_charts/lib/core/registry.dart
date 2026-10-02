import '../basic/bars.dart';
import '../basic/areas.dart';
import '../basic/coordinates.dart';
import '../basic/encodings.dart';
import '../basic/lines.dart';
import '../basic/points.dart';
import '../advanced/combined.dart';
import 'chart_entry.dart';

/// Único punto donde se juntan todas las gráficas.
/// Para agregar una categoría nueva: crea su archivo y haz spread aquí.
final List<ChartEntry> allCharts = [
  ...basicBars,
  ...basicLines,
  ...basicAreas,
  ...basicPoints,
  ...basicCoordinates,
  ...basicEncodings,
  ...advancedCombined,
];

List<ChartEntry> chartsOf(ChartLevel level) =>
    allCharts.where((c) => c.level == level).toList();
