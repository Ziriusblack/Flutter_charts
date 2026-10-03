import 'package:flutter/widgets.dart';

enum ChartLevel { basic, advanced }

/// Una gráfica del taller. Cada gráfica = una entrada.
class ChartEntry {
  const ChartEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.level,
    required this.builder,
    this.isCombined = false, // true => gráfica combinada (cuenta como 1 más)
  });

  final int id; // numeración dentro de su nivel (1..50 o 1..30)
  final String title;
  final String description;
  final String category;
  final ChartLevel level;
  final bool isCombined;
  final Widget Function() builder;
}
