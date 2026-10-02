import 'package:flutter/material.dart';
import '../core/data/models/movie_model.dart';
import '../core/data/services/ghibli_service.dart';
import '../features/fl_chart_feature/fl_chart_screen.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    // 1. Descargamos los datos de la API de Ghibli al iniciar la app
    _moviesFuture = GhibliService.fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ghibli Data Visualization - Hub'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          // Mientras carga la API
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          // Si ocurre un error de red
          else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Error al conectar con la API: ${snapshot.error}', textAlign: TextAlign.center),
              ),
            );
          } 
          // Si no hay datos
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron películas.'));
          }

          // ¡Datos listos!
          final List<Movie> movies = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text(
                    'FL Chart (Wilson otero)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Películas cargadas desde la API: ${movies.length}'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navegamos a tu pantalla de fl_chart pasándole la lista
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FlChartScreen(movies: movies),
                      ),
                    );
                  },
                ),
              ),
              // Aquí tus compañeros irán agregando sus botones después del merge:
              // Card(child: ListTile(title: Text('Graphic (Compañero)'), ...))
            ],
          );
        },
      ),
    );
  }
}