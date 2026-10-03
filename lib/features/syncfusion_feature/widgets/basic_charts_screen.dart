import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_charts/core/data/models/movie_model.dart';

class BasicChartsScreen extends StatelessWidget {
  final List<Movie> movies;

  const BasicChartsScreen({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tomamos las primeras 8 películas para visualizaciones claras
    final sampleMovies = movies.take(8).toList();

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // 1. Gráfico de Columnas: Puntuaciones Rotten Tomatoes
        SizedBox(
          height: 300,
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Puntuación Rotten Tomatoes (Top 8)'),
            primaryXAxis: const CategoryAxis(labelRotation: -45),
            series: <CartesianSeries<Movie, String>>[
              ColumnSeries<Movie, String>(
                dataSource: sampleMovies,
                xValueMapper: (Movie m, _) => m.title,
                // CORRECCIÓN: Pasamos rtScore sin parseos extraños
                yValueMapper: (Movie m, _) => m.rtScore,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ),

        const Divider(height: 40),

        // 2. Gráfico de Dona: Duración en minutos
        SizedBox(
          height: 300,
          child: SfCircularChart(
            title: const ChartTitle(text: 'Duración (Minutos) por Película'),
            legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries<Movie, String>>[
              DoughnutSeries<Movie, String>(
                dataSource: sampleMovies,
                xValueMapper: (Movie m, _) => m.title,
                yValueMapper: (Movie m, _) => m.runningTime, // CORRECCIÓN
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ),

        const Divider(height: 40),

        // 3. Gráfico de Barras Horizontales
        SizedBox(
          height: 300,
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Comparativa Horizontal de Duración'),
            primaryXAxis: const CategoryAxis(),
            series: <CartesianSeries<Movie, String>>[
              BarSeries<Movie, String>(
                dataSource: sampleMovies,
                xValueMapper: (Movie m, _) => m.title,
                yValueMapper: (Movie m, _) => m.runningTime, // CORRECCIÓN
                color: Colors.teal,
              )
            ],
          ),
        ),
      ],
    );
  }
}