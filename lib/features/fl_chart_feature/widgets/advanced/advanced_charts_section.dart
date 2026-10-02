import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/data/models/movie_model.dart';

class AdvancedChartsSection extends StatelessWidget {
  final List<Movie> movies;
  const AdvancedChartsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text('--- Gráficos de Área Avanzados ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: GradientAreaChart(movies: movies)),
        const SizedBox(height: 30),
        
        const Text('--- Gráficos de Radar Avanzados ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: MovieRadarChart(movies: movies)),
        const SizedBox(height: 30),
        
        const Text('--- Gráficos de Barras Apiladas Avanzados ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: StackedBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Áreas Superpuestas ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: MultiAreaChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Dispersión Tipo Burbuja ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: BubbleScatterChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Radar Dual ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: DualRadarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Barras Agrupadas ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: GroupedBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Área Escalonada ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: SteppedAreaChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Área Intercalada ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: AreaBetweenLinesChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Barras Divergentes ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: DivergingBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Dona Dinámica ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: DynamicDonutChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Radar Triple ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: TripleRadarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Dispersión con Formas ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: CustomShapesScatterChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Barras de Rango ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: RangeBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Barras Opuestas ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: OpposingBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Dispersión con Cuadrantes ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: QuadrantScatterChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Torta Explosionada ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: ExplodedPieChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Línea Punteada y Degradado ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: DashedLineAreaChart(movies: movies)),
        const SizedBox(height: 30),
        const Text('--- Zonas de Anotación ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: AnnotatedLineChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Barras Superpuestas ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: OverlappingBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Dispersión Multicategoría ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: MultiCategoryScatterChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Barras con Gradiente ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: GradientShadowBarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Radar Sólido ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: SolidRadarChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Medidor Radial ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: RadialProgressPieChart(movies: movies)),
        const SizedBox(height: 30),

        const Text('--- Curva de Bézier Final ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 10),
        SizedBox(height: 260, child: MasterpieceCurveChart(movies: movies)),
        const SizedBox(height: 30),
      ],
    );
  }
}

// 1. AVANZADO: Área Suavizada con Gradiente (Ejes limpios e intervalo definido)
class GradientAreaChart extends StatelessWidget {
  final List<Movie> movies;
  const GradientAreaChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('1. Tendencia de Área Suavizada (Puntaje)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 80,
              maxY: 100,
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1, 
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            sample[index].title.split(' ').first,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) {
                    return FlSpot(e.key.toDouble(), e.value.rtScore);
                  }).toList(),
                  isCurved: true,
                  barWidth: 4,
                  color: Colors.indigo,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.indigo.withOpacity(0.3),
                  ),
                  dotData: const FlDotData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 2. AVANZADO: Radar - Muestra el rendimiento de las películas
class MovieRadarChart extends StatelessWidget {
  final List<Movie> movies;
  const MovieRadarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('2. Análisis Multidimensional de Películas (Radar)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: RadarChart(
            RadarChartData(
              radarBorderData: const BorderSide(color: Colors.black26),
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.purple.withOpacity(0.3),
                  borderColor: Colors.purple,
                  entryRadius: 3,
                  dataEntries: sample.map((m) {
                    return RadarEntry(value: m.rtScore);
                  }).toList(),
                ),
              ],
              getTitle: (index, angle) {
                if (index < sample.length) {
                  return RadarChartTitle(
                    text: sample[index].title.split(' ').first,
                  );
                }
                return const RadarChartTitle(text: '');
              },
            ),
          ),
        ),
      ],
    );
  }
}

// 3. AVANZADO: Barras Apiladas - Comparación de Puntaje vs Duración (Escalada)
class StackedBarChart extends StatelessWidget {
  final List<Movie> movies;
  const StackedBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('3. Comparativa Apilada: Puntaje (Amarillo) + Duración Escala (Azul)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 180,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            sample[index].title.split(' ').first,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                final score = e.value.rtScore;
                final scaledDuration = e.value.runningTime / 2;

                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: score + scaledDuration,
                      width: 22,
                      borderRadius: BorderRadius.circular(4),
                      rodStackItems: [
                        BarChartRodStackItem(0, score, Colors.amber),
                        BarChartRodStackItem(score, score + scaledDuration, Colors.blueAccent),
                      ],
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
// 4. AVANZADO: Áreas Superpuestas (Comparativa Puntaje vs Duración)
class MultiAreaChart extends StatelessWidget {
  final List<Movie> movies;
  const MultiAreaChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('4. Áreas Superpuestas: Puntaje (Azul) vs Duración (Rojo)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 50,
              maxY: 160,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: true,
                  color: Colors.blueAccent,
                  barWidth: 3,
                  belowBarData: BarAreaData(show: true, color: Colors.blueAccent.withOpacity(0.4)),
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.runningTime.toDouble())).toList(),
                  isCurved: true,
                  color: Colors.redAccent,
                  barWidth: 3,
                  belowBarData: BarAreaData(show: true, color: Colors.redAccent.withOpacity(0.4)),
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 5. AVANZADO: Gráfico de Burbujas (Dispersión con Radio y Color Dinámico)
class BubbleScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const BubbleScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('5. Burbujas: Año vs Puntaje (Tamaño = Duración)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2025,
              minY: 80,
              maxY: 100,
              scatterSpots: movies.take(15).map((m) {
                return ScatterSpot(
                  m.releaseDate.toDouble(),
                  m.rtScore,
                  // CORRECCIÓN: Se pasa la instancia directa, no como una función
                  dotPainter: FlDotCirclePainter(
                    radius: m.runningTime / 8, // El radio cambia según la duración
                    color: Colors.teal.withOpacity(0.7),
                    strokeWidth: 1,
                    strokeColor: Colors.teal,
                  ),
                );
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10,
                    getTitlesWidget: (value, meta) => Text('${value.toInt()}', style: const TextStyle(fontSize: 10)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 6. AVANZADO: Radar Dual (Comparando dos métricas distintas en la misma red)
class DualRadarChart extends StatelessWidget {
  final List<Movie> movies;
  const DualRadarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('6. Radar Dual: Puntaje (Morado) vs Duración (Naranja)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: RadarChart(
            RadarChartData(
              radarBorderData: const BorderSide(color: Colors.black12),
              tickCount: 3,
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.purple.withOpacity(0.3),
                  borderColor: Colors.purple,
                  entryRadius: 3,
                  dataEntries: sample.map((m) => RadarEntry(value: m.rtScore)).toList(),
                ),
                RadarDataSet(
                  fillColor: Colors.deepOrange.withOpacity(0.3),
                  borderColor: Colors.deepOrange,
                  entryRadius: 3,
                  dataEntries: sample.map((m) => RadarEntry(value: m.runningTime.toDouble())).toList(),
                ),
              ],
              getTitle: (index, angle) {
                if (index < sample.length) {
                  return RadarChartTitle(text: sample[index].title.split(' ').first);
                }
                return const RadarChartTitle(text: '');
              },
            ),
          ),
        ),
      ],
    );
  }
}

// 7. AVANZADO: Barras Agrupadas (Lado a Lado)
class GroupedBarChart extends StatelessWidget {
  final List<Movie> movies;
  const GroupedBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(2).take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('7. Barras Agrupadas: Puntaje vs Duración', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 160,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barsSpace: 4,
                  barRods: [
                    BarChartRodData(toY: e.value.rtScore, color: Colors.indigo, width: 12),
                    BarChartRodData(toY: e.value.runningTime.toDouble(), color: Colors.amber, width: 12),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 8. AVANZADO: Área Escalonada con Línea de Límite (Threshold)
class SteppedAreaChart extends StatelessWidget {
  final List<Movie> movies;
  const SteppedAreaChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('8. Área Escalonada (Puntajes vs Base 90)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 80,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isStepLineChart: true,
                  color: Colors.green,
                  barWidth: 3,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.green.withOpacity(0.2),
                  ),
                ),
              ],
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(
                    y: 90,
                    color: Colors.redAccent,
                    strokeWidth: 2,
                    dashArray: [5, 5],
                    label: HorizontalLineLabel(show: true, labelResolver: (line) => 'Meta 90'),
                  ),
                ],
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// 9. AVANZADO: Área entre dos líneas (Relleno intercalado)
class AreaBetweenLinesChart extends StatelessWidget {
  final List<Movie> movies;
  const AreaBetweenLinesChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('9. Área Intercalada: Puntaje vs Duración', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 60,
              maxY: 160,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData( // Línea 0: Puntaje
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                ),
                LineChartBarData( // Línea 1: Duración
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.runningTime.toDouble())).toList(),
                  isCurved: true,
                  color: Colors.red,
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                ),
              ],
              // Propiedad avanzada: Rellena el espacio ENTRE la línea 0 y la línea 1
              betweenBarsData: [
                BetweenBarsData(
                  fromIndex: 0,
                  toIndex: 1,
                  color: Colors.deepPurple.withOpacity(0.3),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 10. AVANZADO: Barras Divergentes (Desviación respecto a un promedio de 90)
class DivergingBarChart extends StatelessWidget {
  final List<Movie> movies;
  const DivergingBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(7).toList();
    const double baseline = 90.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('10. Barras Divergentes: Desviación de Puntaje (Base 90)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 15, // Máximo por encima de 90
              minY: -15, // Máximo por debajo de 90
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: value == 0 ? Colors.black : Colors.black12,
                  strokeWidth: value == 0 ? 2 : 1,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                final deviation = e.value.rtScore - baseline;
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: deviation,
                      color: deviation >= 0 ? Colors.green : Colors.red,
                      width: 16,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 11. AVANZADO: Dona con grosores dinámicos según el rendimiento
class DynamicDonutChart extends StatelessWidget {
  final List<Movie> movies;
  const DynamicDonutChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(4).toList();
    final colors = [Colors.blue, Colors.orange, Colors.purple, Colors.teal];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('11. Dona Dinámica: Radio basado en Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 40, // Esto lo convierte en Dona
              sectionsSpace: 4,
              sections: sample.asMap().entries.map((e) {
                final isTop = e.value.rtScore >= 95;
                return PieChartSectionData(
                  value: e.value.runningTime.toDouble(),
                  title: e.value.title.split(' ').first,
                  color: colors[e.key % colors.length],
                  radius: isTop ? 65 : 50, // Las películas top resaltan hacia afuera
                  titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 12. AVANZADO: Radar Triple (Comparando 3 películas específicas)
class TripleRadarChart extends StatelessWidget {
  final List<Movie> movies;
  const TripleRadarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.length < 3) return const SizedBox();
    final m1 = movies[0];
    final m2 = movies[1];
    final m3 = movies[2];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('12. Radar Triple: Comparativa de 3 Películas', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: RadarChart(
            RadarChartData(
              radarBorderData: const BorderSide(color: Colors.black12),
              tickCount: 4,
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.blue.withOpacity(0.2),
                  borderColor: Colors.blue,
                  entryRadius: 2,
                  dataEntries: [RadarEntry(value: m1.rtScore), RadarEntry(value: m1.runningTime.toDouble()), RadarEntry(value: 90)],
                ),
                RadarDataSet(
                  fillColor: Colors.red.withOpacity(0.2),
                  borderColor: Colors.red,
                  entryRadius: 2,
                  dataEntries: [RadarEntry(value: m2.rtScore), RadarEntry(value: m2.runningTime.toDouble()), RadarEntry(value: 85)],
                ),
                RadarDataSet(
                  fillColor: Colors.green.withOpacity(0.2),
                  borderColor: Colors.green,
                  entryRadius: 2,
                  dataEntries: [RadarEntry(value: m3.rtScore), RadarEntry(value: m3.runningTime.toDouble()), RadarEntry(value: 95)],
                ),
              ],
              getTitle: (index, angle) {
                switch (index) {
                  case 0: return const RadarChartTitle(text: 'Puntaje');
                  case 1: return const RadarChartTitle(text: 'Duración');
                  case 2: return const RadarChartTitle(text: 'Popularidad');
                  default: return const RadarChartTitle(text: '');
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

// 13. AVANZADO: Dispersión con Formas Dinámicas (Cuadrados vs Círculos)
class CustomShapesScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const CustomShapesScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('13. Dispersión Dinámica: Círculos (>95) vs Cuadrados (<95)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2025,
              minY: 80,
              maxY: 100,
              scatterSpots: movies.take(15).map((m) {
                final isMasterpiece = m.rtScore >= 95;
                return ScatterSpot(
                  m.releaseDate.toDouble(),
                  m.rtScore,
                  dotPainter: isMasterpiece
                      ? FlDotCirclePainter(radius: 6, color: Colors.amber, strokeWidth: 1, strokeColor: Colors.black)
                      : FlDotSquarePainter(size: 10, color: Colors.blueGrey, strokeWidth: 1, strokeColor: Colors.black),
                );
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10,
                    getTitlesWidget: (value, meta) => Text('${value.toInt()}', style: const TextStyle(fontSize: 10)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// 14. AVANZADO: Barras de Rango (Puntaje con margen de error simulado)
class RangeBarChart extends StatelessWidget {
  final List<Movie> movies;
  const RangeBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('14. Barras de Rango: Intervalo de Puntaje (Min-Max)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 100,
              minY: 70,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                // Simulamos un rango (ej: puntaje real +- 5 puntos)
                double minScore = e.value.rtScore - 5;
                double maxScore = e.value.rtScore + 5;
                if (maxScore > 100) maxScore = 100;

                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      fromY: minScore, // Inicio dinámico (no empieza en 0)
                      toY: maxScore,
                      color: Colors.cyan,
                      width: 20,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 15. AVANZADO: Barras Opuestas (Puntaje Hacia Arriba vs Duración Hacia Abajo)
class OpposingBarChart extends StatelessWidget {
  final List<Movie> movies;
  const OpposingBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('15. Barras Opuestas: Puntaje (Arriba) vs Duración (Abajo)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 110,
              minY: -160, // Límite negativo para la duración
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: value == 0 ? Colors.black : Colors.black12,
                  strokeWidth: value == 0 ? 2 : 1,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    // Barra positiva (Puntaje)
                    BarChartRodData(
                      toY: e.value.rtScore,
                      color: Colors.green,
                      width: 14,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                    ),
                    // Barra negativa (Duración)
                    BarChartRodData(
                      toY: -e.value.runningTime.toDouble(), // Hacia abajo
                      color: Colors.redAccent,
                      width: 14,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 16. AVANZADO: Dispersión con Cuadrantes (División por Ejes Críticos)
class QuadrantScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const QuadrantScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('16. Cuadrantes Analíticos: Año (>2000) vs Score (>90)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2025,
              minY: 80,
              maxY: 100,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  // Línea crítica en Score = 90
                  if (value == 90) return const FlLine(color: Colors.red, strokeWidth: 2, dashArray: [5, 5]);
                  return const FlLine(color: Colors.transparent);
                },
                getDrawingVerticalLine: (value) {
                  // Línea crítica en Año = 2000
                  if (value == 2000) return const FlLine(color: Colors.blue, strokeWidth: 2, dashArray: [5, 5]);
                  return const FlLine(color: Colors.transparent);
                },
              ),
              scatterSpots: movies.map((m) {
                return ScatterSpot(
                  m.releaseDate.toDouble(),
                  m.rtScore,
                  dotPainter: FlDotCirclePainter(radius: 5, color: Colors.indigo, strokeWidth: 0),
                );
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10,
                    getTitlesWidget: (value, meta) => Text('${value.toInt()}', style: const TextStyle(fontSize: 10)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 17. AVANZADO: Torta Explosionada (Destaca el Mejor y Peor Puntaje de la muestra)
class ExplodedPieChart extends StatelessWidget {
  final List<Movie> movies;
  const ExplodedPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();
    if (sample.isEmpty) return const SizedBox();
    
    final double maxScore = sample.map((m) => m.rtScore).reduce((a, b) => a > b ? a : b);
    final double minScore = sample.map((m) => m.rtScore).reduce((a, b) => a < b ? a : b);
    final colors = [Colors.blue, Colors.orange, Colors.purple, Colors.teal, Colors.pink];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('17. Torta Explosionada: Destacando Extremos', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 30,
              sectionsSpace: 2,
              sections: sample.asMap().entries.map((e) {
                final isMax = e.value.rtScore == maxScore;
                final isMin = e.value.rtScore == minScore;
                // Efecto de explosión: radio más grande y desplazamiento
                final double radius = (isMax || isMin) ? 75 : 55;
                
                return PieChartSectionData(
                  value: e.value.rtScore,
                  title: '${e.value.title.split(' ').first}\n${e.value.rtScore}',
                  color: colors[e.key % colors.length],
                  radius: radius,
                  titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  titlePositionPercentageOffset: 0.6,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 18. AVANZADO: Línea Punteada con Llenado Inferior Degradado
class DashedLineAreaChart extends StatelessWidget {
  final List<Movie> movies;
  const DashedLineAreaChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(3).take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('18. Línea Punteada y Área Degradada', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 80,
              maxY: 100,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: true,
                  color: Colors.deepPurple,
                  barWidth: 3,
                  dashArray: [10, 5], // Punteado
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple.withOpacity(0.5), Colors.deepPurple.withOpacity(0.0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: const FlDotData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// 19. AVANZADO: Línea con Zonas de Anotación (Rendimiento por colores)
class AnnotatedLineChart extends StatelessWidget {
  final List<Movie> movies;
  const AnnotatedLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('19. Línea Anotada: Zonas de Excelencia vs Regulares', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 70,
              maxY: 100,
              // CORRECCIÓN: Va directamente en rangeAnnotations usando el objeto RangeAnnotations
              rangeAnnotations: RangeAnnotations(
                horizontalRangeAnnotations: [
                  HorizontalRangeAnnotation(
                    y1: 90,
                    y2: 100,
                    color: Colors.green.withOpacity(0.15),
                  ),
                  HorizontalRangeAnnotation(
                    y1: 70,
                    y2: 90,
                    color: Colors.orange.withOpacity(0.15),
                  ),
                ],
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: true,
                  color: Colors.black87,
                  barWidth: 4,
                  dotData: const FlDotData(show: true),
                ),
              ],
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 20. AVANZADO: Barras Superpuestas Directas (Una barra detrás de otra)
class OverlappingBarChart extends StatelessWidget {
  final List<Movie> movies;
  const OverlappingBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('20. Barras Superpuestas: Duración (Gris) vs Puntaje (Azul)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 160,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barsSpace: -12, // Superposición negativa clave
                  barRods: [
                    BarChartRodData(
                      toY: e.value.runningTime.toDouble(),
                      color: Colors.grey.shade300,
                      width: 24,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    BarChartRodData(
                      toY: e.value.rtScore,
                      color: Colors.blueAccent,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 21. AVANZADO: Dispersión Multicategoría (Estilos condicionales)
class MultiCategoryScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const MultiCategoryScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('21. Dispersión Multicategoría: Cortas (Rojo) vs Largas (Verde)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2025,
              minY: 80,
              maxY: 100,
              scatterSpots: movies.map((m) {
                final isLong = m.runningTime >= 110;
                return ScatterSpot(
                  m.releaseDate.toDouble(),
                  m.rtScore,
                  dotPainter: FlDotCirclePainter(
                    radius: isLong ? 8 : 5,
                    color: isLong ? Colors.green.withOpacity(0.8) : Colors.redAccent.withOpacity(0.8),
                    strokeWidth: 0,
                  ),
                );
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10,
                    getTitlesWidget: (value, meta) => Text('${value.toInt()}', style: const TextStyle(fontSize: 10)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 22. AVANZADO: Barras con Gradiente Interno y Sombras Simuladas
class GradientShadowBarChart extends StatelessWidget {
  final List<Movie> movies;
  const GradientShadowBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(4).take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('22. Barras Estilizadas: Gradiente y Contenedor de Fondo', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: 100,
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.rtScore,
                      width: 20,
                      gradient: const LinearGradient(
                        colors: [Colors.deepPurple, Colors.pinkAccent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 100,
                        color: Colors.grey.withOpacity(0.2), // Simula un riel de fondo
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 23. AVANZADO: Radar Sólido sin Bordes Internos
class SolidRadarChart extends StatelessWidget {
  final List<Movie> movies;
  const SolidRadarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('23. Radar Sólido: Estructura Poligonal Limpia', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: RadarChart(
            RadarChartData(
              radarBorderData: BorderSide.none, // Quitamos el borde exterior
              tickBorderData: BorderSide.none,  // Quitamos la telaraña interna
              gridBorderData: const BorderSide(color: Colors.black12, width: 1),
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.amber.withOpacity(0.5),
                  borderColor: Colors.transparent,
                  entryRadius: 0,
                  dataEntries: sample.map((m) => RadarEntry(value: m.rtScore)).toList(),
                ),
              ],
              getTitle: (index, angle) {
                if (index < sample.length) {
                  return RadarChartTitle(text: sample[index].title.split(' ').first);
                }
                return const RadarChartTitle(text: '');
              },
            ),
          ),
        ),
      ],
    );
  }
}

// 24. AVANZADO: Torta de Progreso Radial (Medidor Único vs Máximo)
class RadialProgressPieChart extends StatelessWidget {
  final List<Movie> movies;
  const RadialProgressPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();
    final firstMovie = movies.first;
    final remaining = 100 - firstMovie.rtScore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('24. Medidor Radial: Progreso hacia el 100%', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text('${firstMovie.rtScore.toInt()}%', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              PieChart(
                PieChartData(
                  startDegreeOffset: 270,
                  centerSpaceRadius: 60,
                  sectionsSpace: 0,
                  sections: [
                    PieChartSectionData(
                      value: firstMovie.rtScore,
                      color: Colors.teal,
                      radius: 20,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: remaining,
                      color: Colors.grey.withOpacity(0.2),
                      radius: 20,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 25. AVANZADO: Curva de Bézier de Área Compuesta (Gráfico Masterpiece Final)
class MasterpieceCurveChart extends StatelessWidget {
  final List<Movie> movies;
  const MasterpieceCurveChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('25. Gráfico Final: Bézier Compuesto con Sombra Perfilada', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: 70,
              maxY: 105,
              gridData: const FlGridData(show: false), // Limpieza total de malla
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 9, color: Colors.grey)),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: true,
                  curveSmoothness: 0.35,
                  gradient: const LinearGradient(colors: [Colors.indigo, Colors.cyan]),
                  barWidth: 5,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                      radius: 4,
                      color: Colors.white,
                      strokeWidth: 2,
                      strokeColor: Colors.indigo,
                    ),
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [Colors.indigo.withOpacity(0.3), Colors.cyan.withOpacity(0.0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}