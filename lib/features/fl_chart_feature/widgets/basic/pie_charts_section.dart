import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/data/models/movie_model.dart';

class PieChartsSection extends StatelessWidget {
  final List<Movie> movies;
  const PieChartsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DirectorPieChart(movies: movies),
        const SizedBox(height: 30),
        DecadeDonutChart(movies: movies),
        const SizedBox(height: 30),
        ScorePieChart(movies: movies),
        const SizedBox(height: 30),
        EraPieChart(movies: movies),
        const SizedBox(height: 30),
        DurationPieChart(movies: movies),
        const SizedBox(height: 30),
        DirectorComparisonPieChart(movies: movies),
        const SizedBox(height: 30),
        ScoreRangePieChart(movies: movies),
        const SizedBox(height: 30),
        TwoHoursDivisionPieChart(movies: movies),
        const SizedBox(height: 30),
        TitleLengthPieChart(movies: movies),
        const SizedBox(height: 30),
        CenturyPieChart(movies: movies),
        const SizedBox(height: 30),
        EliteScorePieChart(movies: movies),
        const SizedBox(height: 30),
        



      ],
    );
  }
}

// 23. BÁSICO: Torta - Películas por Director con Leyenda de Colores
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
        const Text('23. Películas por Director', style: TextStyle(fontWeight: FontWeight.bold)),
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

// 24. BÁSICO: Anillo (Donut) - Década de lanzamiento
class DecadeDonutChart extends StatelessWidget {
  final List<Movie> movies;
  const DecadeDonutChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> decades = {'80s': 0, '90s': 0, '2000s': 0, '2010+': 0};
    for (var m in movies) {
      if (m.releaseDate < 1990) decades['80s'] = decades['80s']! + 1;
      else if (m.releaseDate < 2000) decades['90s'] = decades['90s']! + 1;
      else if (m.releaseDate < 2010) decades['2000s'] = decades['2000s']! + 1;
      else decades['2010+'] = decades['2010+']! + 1;
    }

    final colors = [Colors.indigo, Colors.cyan, Colors.amber, Colors.deepOrange];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('24. Gráfico de Anillo: Películas por Década', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 50, // <-- Esto lo convierte en un anillo
              sectionsSpace: 4,      // <-- Separación entre los pedazos
              sections: decades.entries.toList().asMap().entries.map((entry) {
                final val = entry.value.value.toDouble();
                return PieChartSectionData(
                  value: val,
                  title: '${entry.value.key}\n(${val.toInt()})',
                  color: colors[entry.key % colors.length],
                  radius: 30,
                  titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// 25. BÁSICO: Torta - Películas según su Puntaje (>95 vs <=95)
class ScorePieChart extends StatelessWidget {
  final List<Movie> movies;
  const ScorePieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int topTier = movies.where((m) => m.rtScore >= 95).length;
    int standardTier = movies.length - topTier;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('25. Proporción de Películas por Nivel de Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: topTier.toDouble(),
                  title: 'Top (>=95)\n$topTier',
                  color: Colors.amber,
                  radius: 60,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                PieChartSectionData(
                  value: standardTier.toDouble(),
                  title: 'Buenas (<95)\n$standardTier',
                  color: Colors.blueGrey,
                  radius: 60,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 26. BÁSICO: Torta - Clásicos (antes del 2000) vs Modernos (2000 o después)
class EraPieChart extends StatelessWidget {
  final List<Movie> movies;
  const EraPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int classic = movies.where((m) => m.releaseDate < 2000).length;
    int modern = movies.length - classic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('26. Torta: Películas Clásicas vs Modernas', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: classic.toDouble(),
                  title: 'Clásicos\n$classic',
                  color: Colors.brown,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  value: modern.toDouble(),
                  title: 'Modernos\n$modern',
                  color: Colors.indigoAccent,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 27. BÁSICO: Torta - Cortas (<100 min) vs Largas (>=100 min)
class DurationPieChart extends StatelessWidget {
  final List<Movie> movies;
  const DurationPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int shortMovies = movies.where((m) => m.runningTime < 100).length;
    int longMovies = movies.length - shortMovies;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('27. Torta: Películas Cortas vs Largas (100 min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 180),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: shortMovies.toDouble(),
                  title: '<100m\n$shortMovies',
                  color: Colors.teal,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  value: longMovies.toDouble(),
                  title: '>=100m\n$longMovies',
                  color: Colors.deepOrange,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 28. BÁSICO: Torta - Miyazaki vs Otros Directores
class DirectorComparisonPieChart extends StatelessWidget {
  final List<Movie> movies;
  const DirectorComparisonPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int miyazakiCount = movies.where((m) => m.director.toLowerCase().contains('miyazaki')).length;
    int othersCount = movies.length - miyazakiCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('28. Torta: Miyazaki vs Otros Directores', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: miyazakiCount.toDouble(),
                  title: 'Miyazaki\n$miyazakiCount',
                  color: Colors.amber,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                PieChartSectionData(
                  value: othersCount.toDouble(),
                  title: 'Otros\n$othersCount',
                  color: Colors.blueGrey,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// 29. BÁSICO: Torta - Rangos de Puntaje (80-89 vs 90-100)
class ScoreRangePieChart extends StatelessWidget {
  final List<Movie> movies;
  const ScoreRangePieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int range80 = movies.where((m) => m.rtScore >= 80 && m.rtScore < 90).length;
    int range90 = movies.length - range80;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('29. Torta: Distribución por Rango de Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: range80.toDouble(),
                  title: '80-89\n$range80',
                  color: Colors.orangeAccent,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  value: range90.toDouble(),
                  title: '90-100\n$range90',
                  color: Colors.green,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 30. BÁSICO: Torta - Menos de 2 horas vs Más de 2 horas
class TwoHoursDivisionPieChart extends StatelessWidget {
  final List<Movie> movies;
  const TwoHoursDivisionPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int underTwoHours = movies.where((m) => m.runningTime < 120).length;
    int overTwoHours = movies.length - underTwoHours;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('30. Torta: Duración (< 120 min vs >= 120 min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: underTwoHours.toDouble(),
                  title: '<120m\n$underTwoHours',
                  color: Colors.lightBlue,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  value: overTwoHours.toDouble(),
                  title: '>=120m\n$overTwoHours',
                  color: Colors.deepPurpleAccent,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// 31. BÁSICO: Torta - Títulos Cortos vs Títulos Largos (por palabras)
class TitleLengthPieChart extends StatelessWidget {
  final List<Movie> movies;
  const TitleLengthPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int shortTitles = movies.where((m) => m.title.split(' ').length <= 2).length;
    int longTitles = movies.length - shortTitles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('31. Torta: Longitud del Título (<=2 palabras vs más)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: shortTitles.toDouble(),
                  title: 'Cortos\n$shortTitles',
                  color: Colors.deepOrange,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  value: longTitles.toDouble(),
                  title: 'Extensos\n$longTitles',
                  color: Colors.indigo,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// 32. BÁSICO: Torta - Siglo XX vs Siglo XXI en Ghibli
class CenturyPieChart extends StatelessWidget {
  final List<Movie> movies;
  const CenturyPieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int twentiethCentury = movies.where((m) => m.releaseDate < 2000).length;
    int twentyFirstCentury = movies.length - twentiethCentury;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('32. Torta: Siglo XX (< 2000) vs Siglo XXI (>= 2000)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: twentiethCentury.toDouble(),
                  title: 'Siglo XX\n$twentiethCentury',
                  color: Colors.blueGrey,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  value: twentyFirstCentury.toDouble(),
                  title: 'Siglo XXI\n$twentyFirstCentury',
                  color: Colors.amber,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// 33. BÁSICO: Torta - Excelencia Extrema (Puntaje >= 95 vs < 95)
class EliteScorePieChart extends StatelessWidget {
  final List<Movie> movies;
  const EliteScorePieChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    int eliteCount = movies.where((m) => m.rtScore >= 95).length;
    int normalCount = movies.length - eliteCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('33. Torta: Excelencia Extrema (Score >= 95)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: eliteCount.toDouble(),
                  title: '>=95\n$eliteCount',
                  color: Colors.amberAccent,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                PieChartSectionData(
                  value: normalCount.toDouble(),
                  title: '<95\n$normalCount',
                  color: Colors.blueGrey,
                  radius: 55,
                  titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}