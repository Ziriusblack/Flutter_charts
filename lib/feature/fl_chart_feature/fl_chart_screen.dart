import 'package:flutter/material.dart';
import '../../core/data/models/movie_model.dart';
import 'basic_charts.dart';
import 'advanced_charts.dart';

class FlChartScreen extends StatelessWidget {
  final List<Movie> movies;

  const FlChartScreen({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Pestañas para Básicos y Avanzados
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis Gráficos (fl_chart)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Básicos (40)'),
              Tab(text: 'Avanzados (25)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Pasamos la data de Ghibli a tus archivos migrados
            BasicCharts(movies: movies),
            AdvancedCharts(movies: movies),
          ],
        ),
      ),
    );
  }
}

// Contenedor principal de los gráficos básicos
class BasicCharts extends StatelessWidget {
  final List<Movie> movies;
  const BasicCharts({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        RatingBarChart(movies: movies),
        const SizedBox(height: 30),
        ScoreLineChart(movies: movies),
        const SizedBox(height: 30),
        DirectorPieChart(movies: movies),
        const SizedBox(height: 30),
        ScatterPlotChart(movies: movies),
        // Aquí iremos agregando los otros 36 básicos...
      ],
    );
  }
}