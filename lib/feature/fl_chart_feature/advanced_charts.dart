import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/data/models/movie_model.dart';

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
        const Text('5. Tendencia de Área Suavizada (Puntaje)', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    // CORRECCIÓN: Usamos rtScore directamente porque ya es double
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
        const Text('6. Análisis Multidimensional de Películas (Radar)', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    // CORRECCIÓN: Usamos rtScore directamente
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
        const Text('7. Comparativa Apilada: Puntaje (Amarillo) + Duración Escala (Azul)', style: TextStyle(fontWeight: FontWeight.bold)),
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
                // CORRECCIÓN: Ya no necesitamos double.tryParse
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

// Contenedor principal de los gráficos avanzados
class AdvancedCharts extends StatelessWidget {
  final List<Movie> movies;
  const AdvancedCharts({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        GradientAreaChart(movies: movies),
        const SizedBox(height: 30),
        MovieRadarChart(movies: movies),
        const SizedBox(height: 30),
        StackedBarChart(movies: movies),
        // Aquí iremos agregando los otros 22 avanzados...
      ],
    );
  }
}