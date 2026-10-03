import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

enum ChartKind { bars, lines, pie, scatter }

enum GalleryFilter { all, basic, advanced }

class ChartSeed {
  const ChartSeed(this.title, this.note, this.kind, {this.mode = 'simple'});

  final String title;
  final String note;
  final ChartKind kind;
  final String mode;
}

class ChartExample {
  const ChartExample({
    required this.number,
    required this.seed,
    required this.advanced,
  });

  final int number;
  final ChartSeed seed;
  final bool advanced;
}

const basicChartSeeds = <ChartSeed>[
  ChartSeed('Ventas por región', 'Comparación de cinco zonas', ChartKind.bars),
  ChartSeed('Películas por década', 'Volumen de estrenos', ChartKind.bars),
  ChartSeed('Puntaje por película', 'Lectura de calificaciones', ChartKind.bars, mode: 'horizontal'),
  ChartSeed('Producción por estudio', 'Unidades por estudio', ChartKind.bars),
  ChartSeed('Ingresos de taquilla', 'Recaudación por categoría', ChartKind.bars),
  ChartSeed('Duración promedio', 'Minutos por género', ChartKind.bars, mode: 'horizontal'),
  ChartSeed('Estrenos por temporada', 'Cantidad de lanzamientos', ChartKind.bars),
  ChartSeed('Vistas por plataforma', 'Audiencia por servicio', ChartKind.bars),
  ChartSeed('Premios por película', 'Reconocimientos obtenidos', ChartKind.bars, mode: 'horizontal'),
  ChartSeed('Presupuesto por proyecto', 'Comparación de inversión', ChartKind.bars),
  ChartSeed('Tendencia de audiencia', 'Cambios de espectadores', ChartKind.lines),
  ChartSeed('Puntaje a través del tiempo', 'Evolución de valoraciones', ChartKind.lines),
  ChartSeed('Ingresos mensuales', 'Serie de doce meses', ChartKind.lines),
  ChartSeed('Estrenos por año', 'Ritmo de producción anual', ChartKind.lines),
  ChartSeed('Duración por temporada', 'Duración media por periodo', ChartKind.lines),
  ChartSeed('Crecimiento de suscriptores', 'Variación durante el año', ChartKind.lines),
  ChartSeed('Ventas semanales', 'Comportamiento semanal', ChartKind.lines),
  ChartSeed('Ocupación de salas', 'Asistencia por función', ChartKind.lines),
  ChartSeed('Costo promedio', 'Variación por periodo', ChartKind.lines),
  ChartSeed('Puntaje de crítica', 'Tendencia de reseñas', ChartKind.lines),
  ChartSeed('Participación por género', 'Distribución porcentual', ChartKind.pie),
  ChartSeed('Películas por director', 'Proporción del catálogo', ChartKind.pie),
  ChartSeed('Ingresos por fuente', 'Composición de ingresos', ChartKind.pie),
  ChartSeed('Audiencia por edad', 'Distribución de espectadores', ChartKind.pie),
  ChartSeed('Votos por categoría', 'Peso relativo de cada grupo', ChartKind.pie),
  ChartSeed('Estrenos por mes', 'Calendario de lanzamientos', ChartKind.pie),
  ChartSeed('Premios por estudio', 'Participación en premios', ChartKind.pie),
  ChartSeed('Presupuesto por origen', 'Composición de inversión', ChartKind.pie),
  ChartSeed('Valoraciones por fuente', 'Aporte de cada plataforma', ChartKind.pie),
  ChartSeed('Formato de exhibición', 'Participación por formato', ChartKind.pie),
  ChartSeed('Presupuesto y puntaje', 'Inversión frente a recepción', ChartKind.scatter),
  ChartSeed('Duración y audiencia', 'Minutos frente a vistas', ChartKind.scatter),
  ChartSeed('Estrenos y taquilla', 'Volumen frente a recaudación', ChartKind.scatter),
  ChartSeed('Crítica y público', 'Comparación de valoraciones', ChartKind.scatter),
  ChartSeed('Costo y duración', 'Recursos frente a tiempo', ChartKind.scatter),
  ChartSeed('Votos y puntaje', 'Votos frente a calificación', ChartKind.scatter),
  ChartSeed('Edad y preferencia', 'Respuesta por segmento', ChartKind.scatter),
  ChartSeed('Publicidad y ventas', 'Promoción frente a resultado', ChartKind.scatter),
  ChartSeed('Salas y asistencia', 'Capacidad frente a ocupación', ChartKind.scatter),
  ChartSeed('Lanzamiento y reseñas', 'Reseñas por periodo', ChartKind.scatter),
];

const advancedChartSeeds = <ChartSeed>[
  ChartSeed('Comparativa regional', 'Series agrupadas por zona', ChartKind.bars, mode: 'grouped'),
  ChartSeed('Ingresos apilados', 'Composición por periodo', ChartKind.bars, mode: 'stacked'),
  ChartSeed('Producción acumulada', 'Aporte de estudios por año', ChartKind.bars, mode: 'stacked'),
  ChartSeed('Rendimiento por plataforma', 'Tres servicios en paralelo', ChartKind.bars, mode: 'grouped'),
  ChartSeed('Costos por categoría', 'Componentes comparados y apilados', ChartKind.bars, mode: 'stacked'),
  ChartSeed('Distribución de estrenos', 'Comparación regional apilada', ChartKind.bars, mode: 'stacked'),
  ChartSeed('Premios por periodo', 'Dos series por año', ChartKind.bars, mode: 'grouped'),
  ChartSeed('Tendencias de valoración', 'Crítica, público y promedio', ChartKind.lines, mode: 'multi'),
  ChartSeed('Proyección de taquilla', 'Serie real y estimada', ChartKind.lines, mode: 'multi'),
  ChartSeed('Audiencia acumulada', 'Áreas por plataforma', ChartKind.lines, mode: 'area'),
  ChartSeed('Comparativo de estudios', 'Tres series de producción', ChartKind.lines, mode: 'multi'),
  ChartSeed('Retención por episodio', 'Curvas por temporada', ChartKind.lines, mode: 'multi'),
  ChartSeed('Presupuesto y retorno', 'Series por periodo', ChartKind.lines, mode: 'area'),
  ChartSeed('Puntajes por fuente', 'Evolución de tres paneles', ChartKind.lines, mode: 'multi'),
  ChartSeed('Composición del catálogo', 'Participación en anillo', ChartKind.pie, mode: 'donut'),
  ChartSeed('Ingresos por canal', 'Distribución con centro libre', ChartKind.pie, mode: 'donut'),
  ChartSeed('Preferencia de audiencia', 'Cuotas por segmento', ChartKind.pie, mode: 'donut'),
  ChartSeed('Reconocimientos', 'Peso de cada tipo de premio', ChartKind.pie, mode: 'donut'),
  ChartSeed('Origen de inversión', 'Distribución de fondos', ChartKind.pie, mode: 'donut'),
  ChartSeed('Mapa de taquilla', 'Costo, vistas y retorno', ChartKind.scatter, mode: 'bubble'),
  ChartSeed('Análisis de reseñas', 'Crítica y audiencia por estudio', ChartKind.scatter, mode: 'multi'),
  ChartSeed('Rendimiento de campañas', 'Inversión y ventas por canal', ChartKind.scatter, mode: 'bubble'),
  ChartSeed('Relación de duración', 'Tres grupos de películas', ChartKind.scatter, mode: 'multi'),
  ChartSeed('Votos y recepción', 'Comparación de tres regiones', ChartKind.scatter, mode: 'multi'),
  ChartSeed('Costo frente a impacto', 'Tamaño del punto según audiencia', ChartKind.scatter, mode: 'bubble'),
];

final basicChartExamples = List<ChartExample>.unmodifiable(
  basicChartSeeds.indexed.map(
    (entry) => ChartExample(number: entry.$1 + 1, seed: entry.$2, advanced: false),
  ),
);

final advancedChartExamples = List<ChartExample>.unmodifiable(
  advancedChartSeeds.indexed.map(
    (entry) => ChartExample(number: entry.$1 + 1, seed: entry.$2, advanced: true),
  ),
);

const _ink = Color(0xFF172C2A);
const _muted = Color(0xFF687773);
const _green = Color(0xFF237B68);
const _line = Color(0xFFE1E7E2);
const _chartColors = <Color>[
  Color(0xFF237B68),
  Color(0xFFE27B58),
  Color(0xFF5578B8),
  Color(0xFFE1B64C),
  Color(0xFF8D6AAE),
  Color(0xFF46A3A1),
];

class ChartGalleryScreen extends StatefulWidget {
  const ChartGalleryScreen({super.key});

  @override
  State<ChartGalleryScreen> createState() => _ChartGalleryScreenState();
}

class _ChartGalleryScreenState extends State<ChartGalleryScreen> {
  GalleryFilter _filter = GalleryFilter.all;
  String _query = '';

  List<ChartExample> _visible(List<ChartExample> examples) {
    final query = _query.trim().toLowerCase();
    return examples.where((example) {
      return query.isEmpty ||
          example.seed.title.toLowerCase().contains(query) ||
          example.seed.note.toLowerCase().contains(query) ||
          example.seed.kind.label.toLowerCase().contains(query);
    }).toList();
  }

  void _selectFilter(GalleryFilter filter) => setState(() => _filter = filter);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 1050;
        final compact = constraints.maxWidth < 650;
        return Scaffold(
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: _filter.index,
                  onDestinationSelected: (index) =>
                      _selectFilter(GalleryFilter.values[index]),
                  destinations: const [
                    NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view_rounded), label: 'Todas'),
                    NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart_rounded), label: 'Básicas'),
                    NavigationDestination(icon: Icon(Icons.auto_graph_outlined), selectedIcon: Icon(Icons.auto_graph_rounded), label: 'Avanzadas'),
                  ],
                ),
          body: SafeArea(
            child: Row(
              children: [
                if (wide) _sideNavigation(),
                Expanded(
                  child: Column(
                    children: [
                      _topBar(compact),
                      Expanded(child: _galleryBody(compact)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sideNavigation() {
    return Container(
      width: 228,
      decoration: const BoxDecoration(
        color: _ink,
        border: Border(right: BorderSide(color: Color(0xFF29413C))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 20, 32),
            child: Row(children: [
              const Icon(Icons.graphic_eq_rounded, color: Color(0xFF83C9A8)),
              const SizedBox(width: 12),
              Text('CAMPO / 01', style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 12, fontWeight: FontWeight.w700)),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 16, 12),
            child: Text('BIBLIOTECA', style: TextStyle(color: Color(0xFF95AAA3), fontSize: 10, fontWeight: FontWeight.w700)),
          ),
          _navItem(0, Icons.grid_view_rounded, 'Todas', '65'),
          _navItem(1, Icons.bar_chart_rounded, 'Básicas', '40'),
          _navItem(2, Icons.auto_graph_rounded, 'Avanzadas', '25'),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 20, 26),
            child: Text('COMMUNITY CHARTS\nFLUTTER · 1.0.4', style: TextStyle(color: Color(0xFF95AAA3), fontSize: 10, height: 1.7, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label, String count) {
    final selected = _filter.index == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Material(
        color: selected ? const Color(0xFF2A4941) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () => _selectFilter(GalleryFilter.values[index]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(children: [
              Icon(icon, size: 18, color: selected ? const Color(0xFF9DE0BE) : const Color(0xFFADC0B9)),
              const SizedBox(width: 12),
              Expanded(child: Text(label, style: TextStyle(color: selected ? Colors.white : const Color(0xFFD0DAD5), fontSize: 13, fontWeight: selected ? FontWeight.w700 : FontWeight.w500))),
              Text(count, style: const TextStyle(color: Color(0xFF95AAA3), fontSize: 11)),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _topBar(bool compact) {
    return Container(
      height: 62,
      padding: EdgeInsets.symmetric(horizontal: compact ? 20 : 32),
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAF8),
        border: Border(bottom: BorderSide(color: _line)),
      ),
      child: Row(children: [
        if (!compact) ...[
          const Text('TALLER DE VISUALIZACIÓN', style: TextStyle(color: _muted, fontSize: 11, fontWeight: FontWeight.w700)),
          const Spacer(),
        ],
        const Icon(Icons.circle, size: 8, color: _green),
        const SizedBox(width: 8),
        const Text('65 composiciones', style: TextStyle(color: _ink, fontSize: 12, fontWeight: FontWeight.w600)),
      ]),
    );
  }

  Widget _galleryBody(bool compact) {
    final showBasic = _filter != GalleryFilter.advanced;
    final showAdvanced = _filter != GalleryFilter.basic;
    final basic = _visible(basicChartExamples);
    final advanced = _visible(advancedChartExamples);

    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = compact ? 20.0 : 40.0;
        final contentWidth = constraints.maxWidth - horizontalPadding * 2;
        final columns = contentWidth >= 900 ? 2 : 1;
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(compact ? 20 : 40, 30, compact ? 20 : 40, 0),
              sliver: SliverToBoxAdapter(
                child: _intro(basic.length, advanced.length, compact),
              ),
            ),
            if (showBasic) ...[
              _sectionHeading('01', 'Gráficas básicas', basic.length, '40 requeridas', horizontalPadding),
              _chartGrid(basic, columns, horizontalPadding),
            ],
            if (showAdvanced) ...[
              _sectionHeading('02', 'Gráficas avanzadas', advanced.length, '25 requeridas', horizontalPadding),
              _chartGrid(advanced, columns, horizontalPadding),
            ],
            if (basic.isEmpty && advanced.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text('No hay gráficas que coincidan con la búsqueda.')),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 42)),
          ],
        );
      },
    );
  }

  Widget _intro(int basicCount, int advancedCount, bool compact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('COLECCIÓN / COMMUNITY CHARTS', style: TextStyle(color: _green, fontSize: 11, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('Atlas de gráficas', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: compact ? 30 : 38)),
              const SizedBox(height: 8),
              const Text('Ejemplos interactivos con datos de películas y estudios.', style: TextStyle(color: _muted, fontSize: 13)),
            ]),
          ),
          if (!compact)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(color: const Color(0xFFE3EFE8), borderRadius: BorderRadius.circular(5)),
              child: const Text('40 básicas  /  25 avanzadas', style: TextStyle(color: _green, fontSize: 11, fontWeight: FontWeight.w700)),
            ),
        ]),
        const SizedBox(height: 24),
        Wrap(spacing: 12, runSpacing: 10, children: [
          _metric('TOTAL', '${basicChartExamples.length + advancedChartExamples.length}', Icons.stacked_bar_chart_rounded),
          _metric('BÁSICAS', '$basicCount', Icons.bar_chart_rounded),
          _metric('AVANZADAS', '$advancedCount', Icons.auto_graph_rounded),
        ]),
        const SizedBox(height: 22),
        TextField(
          onChanged: (value) => setState(() => _query = value),
          decoration: InputDecoration(
            hintText: 'Buscar por nombre, tema o tipo',
            prefixIcon: const Icon(Icons.search_rounded, size: 19),
            suffixIcon: _query.isEmpty ? null : IconButton(
              tooltip: 'Limpiar búsqueda',
              onPressed: () => setState(() => _query = ''),
              icon: const Icon(Icons.close_rounded, size: 18),
            ),
            filled: true,
            fillColor: const Color(0xFFF9FAF8),
            contentPadding: const EdgeInsets.symmetric(vertical: 13),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: _line)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: _green)),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _metric(String label, String value, IconData icon) {
    return Container(
      width: 156,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xFFF9FAF8), border: Border.all(color: _line), borderRadius: BorderRadius.circular(5)),
      child: Row(children: [
        Icon(icon, size: 18, color: _green),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(value, style: const TextStyle(color: _ink, fontSize: 18, fontWeight: FontWeight.w700)),
          Text(label, style: const TextStyle(color: _muted, fontSize: 9, fontWeight: FontWeight.w700)),
        ]),
      ]),
    );
  }

  Widget _sectionHeading(
    String index,
    String title,
    int count,
    String target,
    double horizontalPadding,
  ) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 30, horizontalPadding, 12),
      sliver: SliverToBoxAdapter(
        child: Row(children: [
          Text(index, style: const TextStyle(color: _green, fontSize: 11, fontWeight: FontWeight.w800)),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(color: _ink, fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(width: 10),
          Text('$count', style: const TextStyle(color: _muted, fontSize: 12)),
          const Spacer(),
          Text(target, style: const TextStyle(color: _muted, fontSize: 11)),
        ]),
      ),
    );
  }

  Widget _chartGrid(
    List<ChartExample> examples,
    int columns,
    double horizontalPadding,
  ) {
    if (examples.isEmpty) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        sliver: const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text('No hay resultados en esta sección.', style: TextStyle(color: _muted)),
        ),
        ),
      );
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisExtent: 330,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ChartCard(example: examples[index]),
          childCount: examples.length,
        ),
      ),
    );
  }
}

class ChartCard extends StatelessWidget {
  const ChartCard({super.key, required this.example});

  final ChartExample example;

  @override
  Widget build(BuildContext context) {
    final seed = example.seed;
    return Container(
      height: 330,
      decoration: BoxDecoration(color: const Color(0xFFFCFDFC), borderRadius: BorderRadius.circular(6), border: Border.all(color: _line)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 14, 0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: example.advanced ? const Color(0xFFFFEFE8) : const Color(0xFFE3EFE8), borderRadius: BorderRadius.circular(4)),
              child: Text(example.number.toString().padLeft(2, '0'), style: TextStyle(color: example.advanced ? const Color(0xFFB95C3B) : _green, fontSize: 10, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(width: 11),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(seed.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: _ink, fontSize: 13, fontWeight: FontWeight.w700)),
              const SizedBox(height: 3),
              Text(seed.note, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: _muted, fontSize: 10)),
            ])),
            const SizedBox(width: 8),
            Text(seed.kind.label, style: const TextStyle(color: _muted, fontSize: 9, fontWeight: FontWeight.w700)),
          ]),
        ),
        const SizedBox(height: 4),
        Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(10, 0, 12, 8), child: _buildChart(example))),
        Container(
          height: 31,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(border: Border(top: BorderSide(color: _line))),
          child: Row(children: [
            Icon(Icons.touch_app_outlined, size: 13, color: _muted.withValues(alpha: 0.8)),
            const SizedBox(width: 6),
            const Text('Toca un dato para explorar', style: TextStyle(color: _muted, fontSize: 9)),
            const Spacer(),
            Text(example.advanced ? 'AVANZADA' : 'BÁSICA', style: const TextStyle(color: _muted, fontSize: 8, fontWeight: FontWeight.w700)),
          ]),
        ),
      ]),
    );
  }
}

extension on ChartKind {
  String get label => switch (this) {
        ChartKind.bars => 'BARRAS',
        ChartKind.lines => 'LÍNEAS',
        ChartKind.pie => 'TORTA',
        ChartKind.scatter => 'DISPERSIÓN',
      };
}

class _ChartPoint {
  const _ChartPoint(this.label, this.index, this.values);

  final String label;
  final int index;
  final List<num> values;
}

const _domains = <String>['Norte', 'Sur', 'Este', 'Oeste', 'Centro', 'Costa'];

List<_ChartPoint> _pointsFor(ChartExample example) {
  final seed = example.number + (example.advanced ? 41 : 0);
  return List<_ChartPoint>.generate(_domains.length, (index) {
    final base = 18 + ((index * 19 + seed * 13) % 76);
    return _ChartPoint(
      _domains[(index + seed) % _domains.length],
      index,
      [base, 12 + ((index * 23 + seed * 7) % 68), 10 + ((index * 11 + seed * 17) % 60)],
    );
  });
}

int _seriesCount(ChartExample example) {
  if (!example.advanced || example.seed.kind == ChartKind.pie) return 1;
  return 2 + example.number % 2;
}

charts.Color _chartColor(int index) => charts.ColorUtil.fromDartColor(
      _chartColors[index % _chartColors.length],
    );

List<charts.Series<_ChartPoint, String>> _ordinalSeries(ChartExample example) {
  final points = _pointsFor(example);
  return List.generate(_seriesCount(example), (seriesIndex) {
    return charts.Series<_ChartPoint, String>(
      id: 'Serie ${seriesIndex + 1}',
      displayName: 'Serie ${seriesIndex + 1}',
      data: points,
      domainFn: (point, _) => point.label,
      measureFn: (point, _) => point.values[seriesIndex],
      seriesColor: _chartColor(seriesIndex + example.number),
      colorFn: example.seed.kind == ChartKind.pie
          ? (point, _) => _chartColor(point.index + example.number)
          : null,
      labelAccessorFn: (point, _) => '${point.values[seriesIndex]}',
    );
  });
}

List<charts.Series<_ChartPoint, num>> _numericSeries(ChartExample example) {
  final points = _pointsFor(example);
  return List.generate(_seriesCount(example), (seriesIndex) {
    return charts.Series<_ChartPoint, num>(
      id: 'Serie ${seriesIndex + 1}',
      displayName: 'Serie ${seriesIndex + 1}',
      data: points,
      domainFn: (point, _) => point.index,
      measureFn: (point, _) => point.values[seriesIndex],
      seriesColor: _chartColor(seriesIndex + example.number),
      radiusPxFn: example.seed.mode == 'bubble'
          ? (point, _) => 4 + point.values[seriesIndex] % 8
          : null,
    );
  });
}

Widget _buildChart(ChartExample example) {
  final seed = example.seed;
  final ordinal = _ordinalSeries(example);
  final numeric = _numericSeries(example);
  final hasMultipleSeries = _seriesCount(example) > 1;

  switch (seed.kind) {
    case ChartKind.bars:
      final grouping = switch (seed.mode) {
        'stacked' => charts.BarGroupingType.stacked,
        'groupedStacked' => charts.BarGroupingType.groupedStacked,
        _ => charts.BarGroupingType.grouped,
      };
      return charts.BarChart(
        ordinal,
        animate: true,
        vertical: seed.mode != 'horizontal',
        defaultRenderer: charts.BarRendererConfig<String>(
          groupingType: grouping,
          maxBarWidthPx: 36,
          barGroupInnerPaddingPx: 5,
        ),
        behaviors: hasMultipleSeries
            ? [charts.SeriesLegend<String>(position: charts.BehaviorPosition.bottom)]
            : const [],
      );
    case ChartKind.lines:
      return charts.LineChart(
        numeric,
        animate: true,
        defaultRenderer: charts.LineRendererConfig<num>(
          includePoints: true,
          includeArea: seed.mode == 'area',
          areaOpacity: 0.18,
          stacked: seed.mode == 'stacked',
        ),
        behaviors: hasMultipleSeries
            ? [charts.SeriesLegend<num>(position: charts.BehaviorPosition.bottom)]
            : const [],
      );
    case ChartKind.pie:
      return charts.PieChart<String>(
        ordinal,
        animate: true,
        defaultRenderer: charts.ArcRendererConfig<String>(
          arcRatio: seed.mode == 'donut' ? 0.55 : null,
          arcRendererDecorators: [charts.ArcLabelDecorator<String>()],
        ),
        behaviors: [charts.DatumLegend<String>(position: charts.BehaviorPosition.bottom)],
      );
    case ChartKind.scatter:
      return charts.ScatterPlotChart(
        numeric,
        animate: true,
        behaviors: hasMultipleSeries
            ? [charts.SeriesLegend<num>(position: charts.BehaviorPosition.bottom)]
            : const [],
      );
  }
}