import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/data/models/movie_model.dart';

class LineChartsSection extends StatelessWidget {
  final List<Movie> movies;
  const LineChartsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScoreLineChart(movies: movies),
        const SizedBox(height: 30),
        SteppedScoreChart(movies: movies),
        const SizedBox(height: 30),
        DurationLineChart(movies: movies),
        const SizedBox(height: 30),
        SequentialScoreLineChart(movies: movies),
        const SizedBox(height: 30),
        AlphabeticalScoreLineChart(movies: movies),
        const SizedBox(height: 30),
        ChronologicalDurationLineChart(movies: movies),
        const SizedBox(height: 30),
        ReleaseYearLineChart(movies: movies),
        const SizedBox(height: 30),
        SecondaryDurationLineChart(movies: movies),
        const SizedBox(height: 30),
        CentralScoreLineChart(movies: movies),
        const SizedBox(height: 30),
        InverseDurationLineChart(movies: movies),
        const SizedBox(height: 30),
        
     
      ],
    );
  }
}

// 13. BÁSICO: Líneas - Puntaje por Año (Limpia divisiones del eje X)
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
        const Text('13. Tendencia de Puntajes por Película', style: TextStyle(fontWeight: FontWeight.bold)),
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

// 14. BÁSICO: Línea Escalonada - Variación de puntaje por año
class SteppedScoreChart extends StatelessWidget {
  final List<Movie> movies;
  const SteppedScoreChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    final sample = sorted.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('14. Línea Escalonada: Evolución de Puntajes', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 70,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isStepLineChart: true, // <-- Esto hace que la línea sea escalonada en lugar de recta o curva
                  color: Colors.green,
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
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

// 15. BÁSICO: Línea Recta de Tendencia (Duración)
class DurationLineChart extends StatelessWidget {
  final List<Movie> movies;
  const DurationLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('15. Línea Recta: Duración de Películas (min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 60,
              maxY: 150,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.runningTime)).toList(),
                  isCurved: false, // Línea recta analítica
                  color: Colors.deepPurple,
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

// 16. BÁSICO: Línea - Comparativa de Puntuaciones en Secuencia
class SequentialScoreLineChart extends StatelessWidget {
  final List<Movie> movies;
  const SequentialScoreLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('16. Línea: Secuencia de Puntajes (RT Score)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 80,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: true,
                  color: Colors.cyan,
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

// 17. BÁSICO: Línea - Puntaje Ordenado Alfabéticamente por Título
class AlphabeticalScoreLineChart extends StatelessWidget {
  final List<Movie> movies;
  const AlphabeticalScoreLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => a.title.compareTo(b.title));
    final sample = sorted.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('17. Línea: Puntaje por Orden Alfabético', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 0, // Bajamos el límite a 0 para que no se corten los puntajes bajos
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: false,
                  color: Colors.blueAccent,
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

// 18. BÁSICO: Línea - Duración cronológica de las películas
class ChronologicalDurationLineChart extends StatelessWidget {
  final List<Movie> movies;
  const ChronologicalDurationLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    final sample = sorted.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('18. Línea: Duración Cronológica (min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 60,
              maxY: 160,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.runningTime)).toList(),
                  isCurved: true,
                  color: Colors.deepOrangeAccent,
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
                          child: Text('${sample[index].releaseDate}', style: const TextStyle(fontSize: 9)),
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
// 19. BÁSICO: Línea - Evolución del Año de Estreno Cronológico
class ReleaseYearLineChart extends StatelessWidget {
  final List<Movie> movies;
  const ReleaseYearLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    final sample = sorted.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('19. Línea: Evolución del Año de Estreno', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 1980,
              maxY: 2030,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.releaseDate.toDouble())).toList(),
                  isCurved: false,
                  color: Colors.pink,
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
// 20. BÁSICO: Línea - Variación de Duración (Bloque Secundario)
class SecondaryDurationLineChart extends StatelessWidget {
  final List<Movie> movies;
  const SecondaryDurationLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(4).take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('20. Línea: Variación de Duración (Secundaria)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 70,
              maxY: 150,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.runningTime)).toList(),
                  isCurved: true,
                  color: Colors.tealAccent,
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
// 21. BÁSICO: Línea - Tendencia de Puntajes (Subconjunto Central)
class CentralScoreLineChart extends StatelessWidget {
  final List<Movie> movies;
  const CentralScoreLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(2).take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('21. Línea: Tendencia de Puntajes (Central)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 85,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.rtScore)).toList(),
                  isCurved: false,
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
// 22. BÁSICO: Línea - Duración en Orden Inverso
class InverseDurationLineChart extends StatelessWidget {
  final List<Movie> movies;
  const InverseDurationLineChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.reversed.take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('22. Línea: Duración en Orden Inverso', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 60,
              maxY: 160,
              lineBarsData: [
                LineChartBarData(
                  spots: sample.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.runningTime)).toList(),
                  isCurved: false,
                  color: Colors.purpleAccent,
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