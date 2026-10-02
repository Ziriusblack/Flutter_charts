import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/data/models/movie_model.dart';

class BarChartsSection extends StatelessWidget {
  final List<Movie> movies;
  const BarChartsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBarChart(movies: movies),
        const SizedBox(height: 30),
        HorizontalDurationBarChart(movies: movies),
        const SizedBox(height: 30),
        GradientBarChart(movies: movies),
        const SizedBox(height: 30),
        DurationBarChart(movies: movies),
        const SizedBox(height: 30),
        HorizontalYearBarChart(movies: movies),
        const SizedBox(height: 30),
        ProducerBarChart(movies: movies),
        const SizedBox(height: 30),
        DecadeBarChart(movies: movies),
        const SizedBox(height: 30),
        TopLongestMoviesBarChart(movies: movies),
        const SizedBox(height: 30),
        MinMaxScoreBarChart(movies: movies),
        const SizedBox(height: 30),
        AlternateRatingBarChart(movies: movies),
        const SizedBox(height: 30),
        TopShortestMoviesBarChart(movies: movies),
        const SizedBox(height: 30),
        FinalBlockBarChart(movies: movies),
        const SizedBox(height: 30)






      ],
    );
  }
}

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

// 2. BÁSICO: Barras Horizontales - Top 5 Películas más largas
class HorizontalDurationBarChart extends StatelessWidget {
  final List<Movie> movies;
  const HorizontalDurationBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // Ordenamos por duración de mayor a menor y tomamos 5
    final sorted = List<Movie>.from(movies)..sort((a, b) => b.runningTime.compareTo(a.runningTime));
    final topLongest = sorted.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('2. Barras Horizontales: Top 5 Películas más largas (min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          // Giramos el contenedor 90 grados a la derecha
          child: RotatedBox(
            quarterTurns: 1,
            child: BarChart(
              BarChartData(
                maxY: 160,
                barGroups: topLongest.asMap().entries.map((e) {
                  return BarChartGroupData(
                    x: e.key,
                    barRods: [
                      BarChartRodData(
                        toY: e.value.runningTime,
                        color: Colors.pinkAccent,
                        width: 16,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                      )
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        // Des-giramos el texto de los números para que se lean bien
                        return RotatedBox(quarterTurns: -1, child: Text('${value.toInt()}', style: const TextStyle(fontSize: 10)));
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < topLongest.length) {
                          // Des-giramos los títulos de las películas
                          return RotatedBox(
                            quarterTurns: -1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(topLongest[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
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
        ),
      ],
    );
  }
}

// 3. BÁSICO: Barras con Gradiente de Color
class GradientBarChart extends StatelessWidget {
  final List<Movie> movies;
  const GradientBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('3. Barras con Gradiente: Puntaje por Película', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 100,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.rtScore,
                      width: 22,
                      // Gradiente visual moderno
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
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

// 4. BÁSICO: Barras - Duración de Películas Ordenadas
class DurationBarChart extends StatelessWidget {
  final List<Movie> movies;
  const DurationBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('4. Barras: Duración en Minutos por Película', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 160,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.runningTime,
                      color: Colors.orange,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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

// 5. BÁSICO: Barras Horizontales - Ordenadas por Año
class HorizontalYearBarChart extends StatelessWidget {
  final List<Movie> movies;
  const HorizontalYearBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
    final sample = sorted.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('5. Barras Horizontales: Películas por Año de Estreno', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: RotatedBox(
            quarterTurns: 1,
            child: BarChart(
              BarChartData(
                maxY: 2030,
                barGroups: sample.asMap().entries.map((e) {
                  return BarChartGroupData(
                    x: e.key,
                    barRods: [
                      BarChartRodData(
                        toY: e.value.releaseDate.toDouble(),
                        color: Colors.purple,
                        width: 16,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                      )
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) => RotatedBox(quarterTurns: -1, child: Text('${value.toInt()}', style: const TextStyle(fontSize: 10))),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < sample.length) {
                          return RotatedBox(
                            quarterTurns: -1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(sample[index].title.split(' ').first, style: const TextStyle(fontSize: 10)),
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
        ),
      ],
    );
  }
}

// 6. BÁSICO: Barras - Películas por Productor
class ProducerBarChart extends StatelessWidget {
  final List<Movie> movies;
  const ProducerBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> counts = {};
    for (var m in movies) {
      counts[m.producer] = (counts[m.producer] ?? 0) + 1;
    }
    final sample = counts.entries.take(5).toList();
    
    // Calculamos dinámicamente el valor máximo para evitar desbordes
    double maxCount = counts.values.isNotEmpty 
        ? counts.values.reduce((a, b) => a > b ? a : b).toDouble() 
        : 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('6. Barras: Películas por Productor', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: maxCount + 2, // Agregamos un margen superior de 2 puntos
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.value.toDouble(),
                      color: Colors.brown,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].key.split(' ').first, style: const TextStyle(fontSize: 10)),
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

// 7. BÁSICO: Barras - Cantidad de películas por Década
class DecadeBarChart extends StatelessWidget {
  final List<Movie> movies;
  const DecadeBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> decades = {};
    for (var m in movies) {
      int decadeInt = (m.releaseDate ~/ 10) * 10;
      String decadeKey = '${decadeInt}s';
      decades[decadeKey] = (decades[decadeKey] ?? 0) + 1;
    }
    final sample = decades.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('7. Barras: Películas por Década de Estreno', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 15,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.value.toDouble(),
                      color: Colors.indigoAccent,
                      width: 22,
                      borderRadius: BorderRadius.circular(4),
                    ),
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
                      if (index >= 0 && index < sample.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(sample[index].key, style: const TextStyle(fontSize: 10)),
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

// 8. BÁSICO: Barras - Top Películas más Largas (min)
class TopLongestMoviesBarChart extends StatelessWidget {
  final List<Movie> movies;
  const TopLongestMoviesBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => b.runningTime.compareTo(a.runningTime));
    final sample = sorted.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('8. Barras: Top Películas más Largas (min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 180,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.runningTime,
                      color: Colors.deepPurple,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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

// 9. BÁSICO: Barras - Puntaje Mínimo vs Máximo de la Muestra
class MinMaxScoreBarChart extends StatelessWidget {
  final List<Movie> movies;
  const MinMaxScoreBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('9. Barras: Métrica de Puntaje Base por Película', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 100,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.rtScore,
                      color: Colors.cyan,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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
// 10. BÁSICO: Barras - Rango Alternativo de Puntajes (Películas 6 a 10)
class AlternateRatingBarChart extends StatelessWidget {
  final List<Movie> movies;
  const AlternateRatingBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(5).take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('10. Barras: Puntajes - Bloque Alternativo', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 100,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.rtScore,
                      color: Colors.amberAccent,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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
// 11. BÁSICO: Barras - Top Películas más Cortas (min)
class TopShortestMoviesBarChart extends StatelessWidget {
  final List<Movie> movies;
  const TopShortestMoviesBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sorted = List<Movie>.from(movies)..sort((a, b) => a.runningTime.compareTo(b.runningTime));
    final sample = sorted.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('11. Barras: Top Películas más Cortas (min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 140,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.runningTime,
                      color: Colors.pinkAccent,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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

// 12. BÁSICO: Barras - Bloque Final de Puntajes
class FinalBlockBarChart extends StatelessWidget {
  final List<Movie> movies;
  const FinalBlockBarChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final sample = movies.skip(10).take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('12. Barras: Puntajes del Bloque Final', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: 100,
              barGroups: sample.asMap().entries.map((e) {
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.rtScore,
                      color: Colors.lightGreen,
                      width: 20,
                      borderRadius: BorderRadius.circular(4),
                    ),
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