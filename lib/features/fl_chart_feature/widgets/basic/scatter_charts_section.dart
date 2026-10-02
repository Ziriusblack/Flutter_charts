import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/data/models/movie_model.dart';

// Contenedor principal de dispersión básicos
class ScatterChartsSection extends StatelessWidget {
  final List<Movie> movies;
  const ScatterChartsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScatterPlotChart(movies: movies),
        const SizedBox(height: 30),
        YearVsScoreScatterChart(movies: movies),
        const SizedBox(height: 30),
        ReleaseVsDurationScatterChart(movies: movies),
        const SizedBox(height: 30),
        IndexVsScoreScatterChart(movies: movies),
        const SizedBox(height: 30),
        TimelineScatterChart(movies: movies),
        const SizedBox(height: 30),
        CatalogOrderScatterChart(movies: movies),
        const SizedBox(height: 30),
        FinalConsolidatedScatterChart(movies: movies),
        const SizedBox(height: 30),
        



        
      ],
    );
  }
}

// 34. BÁSICO: Dispersión - Duración vs Puntaje
class ScatterPlotChart extends StatelessWidget {
  final List<Movie> movies;
  const ScatterPlotChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('34 Dispersión: Duración (min) vs Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
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

// 35. BÁSICO: Dispersión - Año de Estreno vs Puntaje
class YearVsScoreScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const YearVsScoreScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('35. Dispersión: Año de Estreno vs Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2020,
              minY: 85,
              maxY: 100,
              scatterSpots: movies.map((m) {
                return ScatterSpot(m.releaseDate.toDouble(), m.rtScore);
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


// 36. BÁSICO: Dispersión - Año de Estreno vs Duración en Minutos
class ReleaseVsDurationScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const ReleaseVsDurationScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('36. Dispersión: Año de Estreno vs Duración (min)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2025,
              minY: 60,
              maxY: 160,
              scatterSpots: movies.map((m) {
                return ScatterSpot(m.releaseDate.toDouble(), m.runningTime);
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
// 37. BÁSICO: Dispersión - Índice de Película vs Puntaje
class IndexVsScoreScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const IndexVsScoreScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('37. Dispersión: Índice de Registro vs Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 0,
              maxX: movies.length.toDouble(),
              minY: 80,
              maxY: 100,
              scatterSpots: movies.asMap().entries.map((e) {
                return ScatterSpot(e.key.toDouble(), e.value.rtScore);
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5,
                    getTitlesWidget: (value, meta) => Text('#${value.toInt()}', style: const TextStyle(fontSize: 10)),
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
// 38. BÁSICO: Dispersión - Secuencia de Películas vs Año de Lanzamiento
class TimelineScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const TimelineScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('38. Dispersión: Secuencia de ID vs Año de Lanzamiento', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 0,
              maxX: movies.length.toDouble(),
              minY: 1980,
              maxY: 2025,
              scatterSpots: movies.asMap().entries.map((e) {
                return ScatterSpot(e.key.toDouble(), e.value.releaseDate.toDouble());
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5,
                    getTitlesWidget: (value, meta) => Text('#${value.toInt()}', style: const TextStyle(fontSize: 10)),
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
// 39. BÁSICO: Dispersión - Orden de Catálogo vs Puntaje
class CatalogOrderScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const CatalogOrderScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('39. Dispersión: Orden de Catálogo vs Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 0,
              maxX: movies.length.toDouble(),
              minY: 80,
              maxY: 100,
              scatterSpots: movies.asMap().entries.map((e) {
                return ScatterSpot(e.key.toDouble(), e.value.rtScore);
              }).toList(),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 4,
                    getTitlesWidget: (value, meta) => Text('#${value.toInt()}', style: const TextStyle(fontSize: 10)),
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
// 40. BÁSICO: Dispersión - Consolidado Año vs Puntaje
class FinalConsolidatedScatterChart extends StatelessWidget {
  final List<Movie> movies;
  const FinalConsolidatedScatterChart({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('40. Dispersión: Consolidado Año vs Puntaje', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ScatterChart(
            ScatterChartData(
              minX: 1980,
              maxX: 2025,
              minY: 80,
              maxY: 100,
              scatterSpots: movies.map((m) {
                return ScatterSpot(m.releaseDate.toDouble(), m.rtScore);
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