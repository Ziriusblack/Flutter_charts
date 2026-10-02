import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/data/models/movie_model.dart';

// 1. BÁSICO: Barras - Top 5 Películas (Muestra título corto en el eje X)
class RatingBarChart extends StatelessWidget {
  final List<Movie> movies;
  const RatingBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final topMovies = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('1. Puntaje Rotten Tomatoes (Top 5)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 100,
              barGroups: topMovies.asMap().entries.map((e) {
                // CORRECCIÓN: rtScore ya es un double
                final score = e.value.rtScore;
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: score,
                      color: Colors.teal,
                      width: 22,
                      borderRadius: BorderRadius.circular(4),
                    )
                  ],
                );
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < topMovies.length) {
                        // Muestra solo la primera palabra del título
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            topMovies[index].title.split(' ').first,
                            style: const TextStyle(fontSize: 10),
                          ),
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

// 2. BÁSICO: Líneas - Puntaje por Año (Limpia divisiones del eje X)
class ScoreLineChart extends StatelessWidget {
  final List<Movie> movies;
  const ScoreLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // CORRECCIÓN: releaseDate ya es int, se comparan directamente
    final sortedMovies = List<Movie>.from(movies)
      ..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    final sample = sortedMovies.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('2. Tendencia de Puntajes por Película', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 60,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) {
                    // CORRECCIÓN: rtScore ya es double
                    final score = e.value.rtScore;
                    return FlSpot(e.key.toDouble(), score);
                  }).toList(),
                  isCurved: true,
                  color: Colors.deepOrange,
                  barWidth: 3,
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
                          // CORRECCIÓN: releaseDate es int, agregamos .toString() para el widget Text
                          child: Text(sample[index].releaseDate.toString(), style: const TextStyle(fontSize: 10)),
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

// 3. BÁSICO: Torta - Películas por Director con Leyenda de Colores
class DirectorPieChart extends StatelessWidget {
  final List<Movie> movies;
  const DirectorPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> counts = {};
    for (var m in movies) {
      counts[m.director] = (counts[m.director] ?? 0) + 1;
    }

    final colors = [Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.purple, Colors.amber];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('3. Películas por Director', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: Row(
            children: [
              Expanded(
                child: PieChart(
                  PieChartData(
                    sections: counts.entries.toList().asMap().entries.map((entry) {
                      final idx = entry.key;
                      final val = entry.value;
                      return PieChartSectionData(
                        value: val.value.toDouble(),
                        title: '${val.value}',
                        color: colors[idx % colors.length],
                        radius: 40,
                        titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Leyenda lateral
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: counts.keys.toList().asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      children: [
                        Container(width: 12, height: 12, color: colors[entry.key % colors.length]),
                        const SizedBox(width: 6),
                        Text(entry.value.split(' ').last, style: const TextStyle(fontSize: 11)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 4. BÁSICO: Dispersión - Duración vs Puntaje (Con intervalos definidos)
class ScatterPlotChart extends StatelessWidget {
  final List<Movie> movies;
  const ScatterPlotChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('4. Dispersión: Duración (min) vs Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 70,
              maxX: 140,
              minY: 80,
              maxY: 100,
              scatterSpots: movies.take(12).map((m) {
                // CORRECCIÓN: runningTime y rtScore ya son double
                final duration = m.runningTime;
                final score = m.rtScore;
                return ScatterSpot(duration, score);
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20, 
                    getTitlesWidget: (value, meta) => Text('${value.toInt()}m', style: const TextStyle(fontSize: 10)),
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