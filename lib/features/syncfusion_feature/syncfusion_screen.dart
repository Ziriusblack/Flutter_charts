import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../core/data/models/movie_model.dart';
import '../../core/data/services/ghibli_service.dart';

class SyncfusionChartsScreen extends StatefulWidget {
  const SyncfusionChartsScreen({Key? key}) : super(key: key);

  @override
  State<SyncfusionChartsScreen> createState() => _SyncfusionChartsScreenState();
}

class _SyncfusionChartsScreenState extends State<SyncfusionChartsScreen> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    // Llamamos al servicio que ya creó tu equipo
    futureMovies = GhibliService.fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gráficos Syncfusion Ghibli'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Básicos (40)', icon: Icon(Icons.bar_chart)),
              Tab(text: 'Avanzados (25)', icon: Icon(Icons.auto_graph)),
            ],
          ),
        ),
        body: FutureBuilder<List<Movie>>(
          future: futureMovies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No hay películas disponibles'));
            }

            final movies = snapshot.data!;

            return TabBarView(
              children: [
                // Pestaña 1: 40 Gráficos Básicos
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 40,
                  itemBuilder: (context, index) => _buildBasicChart(index, movies),
                ),
                // Pestaña 2: 25 Gráficos Avanzados
                ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 25,
                  itemBuilder: (context, index) => _buildAdvancedChart(index, movies),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

// ==========================================
  // GENERADOR DE 40 GRÁFICOS BÁSICOS
  // ==========================================
  Widget _buildBasicChart(int index, List<Movie> movies) {
    // Cruzamos 8 tipos de gráficos con 5 configuraciones de datos (8 * 5 = 40)
    final chartTypeIndex = index % 8;
    final dataConfigIndex = (index ~/ 8) % 5;

    // 1. Extraer los datos según la configuración (Eje X y Eje Y)
    String xAxisTitle = '';
    String yAxisTitle = '';
    String chartTitle = 'Gráfico Básico ${index + 1}';
    List<Movie> data = movies;

    double Function(Movie, int) yValueMapper;
    String Function(Movie, int) xValueMapper;

    switch (dataConfigIndex) {
      case 0:
        xValueMapper = (Movie m, _) => m.title;
        yValueMapper = (Movie m, _) => m.rtScore;
        xAxisTitle = 'Película'; yAxisTitle = 'Puntuación (RT)';
        chartTitle += ' - Puntuación por Película';
        break;
      case 1:
        xValueMapper = (Movie m, _) => m.title;
        yValueMapper = (Movie m, _) => m.runningTime;
        xAxisTitle = 'Película'; yAxisTitle = 'Duración (min)';
        chartTitle += ' - Duración por Película';
        break;
      case 2:
        xValueMapper = (Movie m, _) => m.releaseDate.toString();
        yValueMapper = (Movie m, _) => m.rtScore;
        xAxisTitle = 'Año de Estreno'; yAxisTitle = 'Puntuación (RT)';
        chartTitle += ' - Puntuación por Año';
        // Ordenar por año para gráficos de líneas
        data = List.from(movies)..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
        break;
      case 3:
        xValueMapper = (Movie m, _) => m.releaseDate.toString();
        yValueMapper = (Movie m, _) => m.runningTime;
        xAxisTitle = 'Año de Estreno'; yAxisTitle = 'Duración (min)';
        chartTitle += ' - Duración por Año';
        data = List.from(movies)..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
        break;
      case 4: default:
        xValueMapper = (Movie m, _) => m.director;
        yValueMapper = (Movie m, _) => m.rtScore;
        xAxisTitle = 'Director'; yAxisTitle = 'Puntuación (RT)';
        chartTitle += ' - Puntuación por Director';
        break;
    }

    // 2. Seleccionar el tipo de Serie de Syncfusion
    // ¡AQUÍ ESTÁ LA CORRECCIÓN CLAVE! Usamos CartesianSeries en lugar de ChartSeries
    CartesianSeries<Movie, String> series;
    switch (chartTypeIndex) {
      case 0: series = ColumnSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 1: series = BarSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 2: series = LineSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 3: series = AreaSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 4: series = SplineSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 5: series = ScatterSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 6: series = StepLineSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
      case 7: default: series = WaterfallSeries<Movie, String>(dataSource: data, xValueMapper: xValueMapper, yValueMapper: yValueMapper); break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 300,
          child: SfCartesianChart(
            title: ChartTitle(text: chartTitle, textStyle: const TextStyle(fontSize: 14)),
            primaryXAxis: CategoryAxis(title: AxisTitle(text: xAxisTitle), labelRotation: 45),
            primaryYAxis: NumericAxis(title: AxisTitle(text: yAxisTitle)),
            // ¡Y AQUÍ SE APLICA LA CORRECCIÓN! CartesianSeries
            series: <CartesianSeries<Movie, String>>[series],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // GENERADOR DE 25 GRÁFICOS AVANZADOS
  // ==========================================
  Widget _buildAdvancedChart(int index, List<Movie> movies) {
    // Cruzamos 5 estilos avanzados con 5 cruces de datos (5 * 5 = 25)
    final styleIndex = index % 5;
    final dataIndex = (index ~/ 5) % 5;

    // Configuración interactiva común para gráficos avanzados
    final trackballBehavior = TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap);
    final zoomPanBehavior = ZoomPanBehavior(enablePinching: true, enablePanning: true, zoomMode: ZoomMode.x);
    final tooltipBehavior = TooltipBehavior(enable: true, header: 'Detalle');

    String title = 'Avanzado ${index + 1}';
    Widget chart;

    // Diferentes datos según el índice
    final isScore = dataIndex % 2 == 0; 
    
    // Generar diferentes tipos de gráficos avanzados
   switch (styleIndex) {
      case 0: // Burbuja Interactiva
        chart = SfCartesianChart(
          title: ChartTitle(text: '$title: Burbuja de Películas'),
          zoomPanBehavior: zoomPanBehavior,
          tooltipBehavior: tooltipBehavior,
          primaryXAxis: CategoryAxis(labelRotation: 45),
          // CORRECCIÓN AQUÍ: CartesianSeries en lugar de ChartSeries
          series: <CartesianSeries<Movie, String>>[
            BubbleSeries<Movie, String>(
              dataSource: movies,
              xValueMapper: (Movie m, _) => m.title,
              yValueMapper: (Movie m, _) => isScore ? m.rtScore : m.runningTime,
              sizeValueMapper: (Movie m, _) => isScore ? m.runningTime : m.rtScore,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
          ],
        );
        break;
      case 1: // Spline Area con Gradiente
        chart = SfCartesianChart(
          title: ChartTitle(text: '$title: Área Suavizada (Zoom)'),
          zoomPanBehavior: zoomPanBehavior,
          trackballBehavior: trackballBehavior,
          primaryXAxis: CategoryAxis(labelRotation: 45),
          // CORRECCIÓN AQUÍ: CartesianSeries
          series: <CartesianSeries<Movie, String>>[
            SplineAreaSeries<Movie, String>(
              dataSource: movies,
              xValueMapper: (Movie m, _) => m.title,
              yValueMapper: (Movie m, _) => isScore ? m.rtScore : m.runningTime,
              gradient: LinearGradient(
                colors: [Colors.blue.withOpacity(0.5), Colors.blue.withOpacity(0.1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )
          ],
        );
        break;
      case 2: // Columnas con DataLabels y Trackball
        chart = SfCartesianChart(
          title: ChartTitle(text: '$title: Análisis Detallado'),
          tooltipBehavior: tooltipBehavior,
          trackballBehavior: trackballBehavior,
          primaryXAxis: CategoryAxis(labelRotation: 45),
          // CORRECCIÓN AQUÍ: CartesianSeries
          series: <CartesianSeries<Movie, String>>[
            ColumnSeries<Movie, String>(
              dataSource: movies,
              xValueMapper: (Movie m, _) => m.title,
              yValueMapper: (Movie m, _) => isScore ? m.rtScore : m.runningTime,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
              ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            )
          ],
        );
        break;
      case 3: // Gráfico Circular Interactivo (Doughnut)
        // Este queda igual porque ya usa CircularSeries
        chart = SfCircularChart(
          title: ChartTitle(text: '$title: Distribución General'),
          tooltipBehavior: tooltipBehavior,
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries<Movie, String>>[
            DoughnutSeries<Movie, String>(
              dataSource: movies.take(10).toList(),
              xValueMapper: (Movie m, _) => m.title,
              yValueMapper: (Movie m, _) => isScore ? m.rtScore : m.runningTime,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              explode: true,
              explodeAll: true,
            )
          ],
        );
        break;
      case 4: default: // Dos series en el mismo gráfico
        chart = SfCartesianChart(
          title: ChartTitle(text: '$title: Comparativa Score vs Duración'),
          zoomPanBehavior: zoomPanBehavior,
          tooltipBehavior: tooltipBehavior,
          legend: Legend(isVisible: true, position: LegendPosition.bottom),
          primaryXAxis: CategoryAxis(labelRotation: 45),
          // CORRECCIÓN AQUÍ: CartesianSeries
          series: <CartesianSeries<Movie, String>>[
            StackedColumnSeries<Movie, String>(
              dataSource: movies,
              name: 'Score',
              xValueMapper: (Movie m, _) => m.title,
              yValueMapper: (Movie m, _) => m.rtScore,
            ),
            StackedColumnSeries<Movie, String>(
              dataSource: movies,
              name: 'Duración',
              xValueMapper: (Movie m, _) => m.title,
              yValueMapper: (Movie m, _) => m.runningTime,
            )
          ],
        );
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 6,
      shadowColor: Colors.blueAccent.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 350, // Más altos porque tienen leyenda y zoom
          child: chart,
        ),
      ),
    );
  }
}