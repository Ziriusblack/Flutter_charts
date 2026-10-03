import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_charts/core/data/models/movie_model.dart';

class AdvancedChartsScreen extends StatelessWidget {
  final List<Movie> movies;

  const AdvancedChartsScreen({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CORRECCIÓN: Se ordenan directamente porque releaseDate ya es un int
    final sortedMovies = List<Movie>.from(movies)
      ..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // 1. Gráfico de Área Esplín: Tendencia Histórica de Puntuación
        SizedBox(
          height: 320,
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Evolución Histórica de Puntuación por Año'),
            primaryXAxis: const CategoryAxis(
              title: AxisTitle(text: 'Año de Lanzamiento'),
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<Movie, String>>[
              SplineAreaSeries<Movie, String>(
                dataSource: sortedMovies,
                // CORRECCIÓN: Se convierte el año a String solo para el eje X
                xValueMapper: (Movie m, _) => m.releaseDate.toString(),
                // CORRECCIÓN: Se pasa el int directamente
                yValueMapper: (Movie m, _) => m.rtScore,
                name: 'Rotten Tomatoes',
                color: Colors.purple.withOpacity(0.4),
                borderColor: Colors.purple,
                borderWidth: 2,
              )
            ],
          ),
        ),

        const Divider(height: 40),

        // 2. Gráfico de Dispersión (Scatter): Relación Duración vs Puntuación
        SizedBox(
          height: 320,
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Dispersión: Duración (X) vs Puntuación (Y)'),
            primaryXAxis: const NumericAxis(title: AxisTitle(text: 'Duración (min)')),
            primaryYAxis: const NumericAxis(title: AxisTitle(text: 'Puntuación RT')),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<Movie, num>>[
              ScatterSeries<Movie, num>(
                dataSource: sortedMovies,
                // CORRECCIÓN: Se pasan los int directamente
                xValueMapper: (Movie m, _) => m.runningTime,
                yValueMapper: (Movie m, _) => m.rtScore,
                markerSettings: const MarkerSettings(
                  height: 12,
                  width: 12,
                  shape: DataMarkerType.diamond,
                ),
              )
            ],
          ),
        ),

        const Divider(height: 40),

        // 3. Gráfico Combinado: Columnas (Puntuación) + Líneas (Duración)
        SizedBox(
          height: 320,
          child: SfCartesianChart(
            title: const ChartTitle(text: 'Comparación Múltiple (Puntaje vs Duración)'),
            primaryXAxis: const CategoryAxis(labelRotation: -45),
            legend: const Legend(isVisible: true),
            series: <CartesianSeries<Movie, String>>[
              ColumnSeries<Movie, String>(
                dataSource: sortedMovies.take(6).toList(),
                xValueMapper: (Movie m, _) => m.title,
                yValueMapper: (Movie m, _) => m.rtScore, // CORRECCIÓN
                name: 'Puntaje RT',
              ),
              LineSeries<Movie, String>(
                dataSource: sortedMovies.take(6).toList(),
                xValueMapper: (Movie m, _) => m.title,
                yValueMapper: (Movie m, _) => m.runningTime, // CORRECCIÓN
                name: 'Duración (min)',
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}