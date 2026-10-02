import 'package:flutter/material.dart';
import '../../core/data/models/movie_model.dart';
import 'widgets/basic/bar_charts_section.dart';
import 'widgets/basic/line_charts_section.dart';
import 'widgets/basic/pie_charts_section.dart';
import 'widgets/basic/scatter_charts_section.dart';
import 'widgets/advanced/advanced_charts_section.dart';

class FlChartScreen extends StatelessWidget {
  final List<Movie> movies;

  const FlChartScreen({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Básicos vs Avanzados
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Galería de Gráficos (fl_chart)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Gráficos Básicos (40)'),
              Tab(text: 'Gráficos Avanzados (25)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // PESTAÑA 1: BÁSICOS (Un único ListView maestro que contiene Columnas)
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text('--- SECCIÓN BARRAS ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                BarChartsSection(movies: movies),
                const SizedBox(height: 30),
                const Text('--- SECCIÓN LÍNEAS ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                LineChartsSection(movies: movies),
                const SizedBox(height: 30),
                const Text('--- SECCIÓN PASTEL / ANILLOS ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                PieChartsSection(movies: movies),
                const SizedBox(height: 30),
                const Text('--- SECCIÓN DISPERSIÓN ---', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                ScatterChartsSection(movies: movies),
              ],
            ),
            
            // PESTAÑA 2: AVANZADOS
            AdvancedChartsSection(movies: movies),
          ],
        ),
      ),
    );
  }
}