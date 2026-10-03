import 'package:flutter/material.dart';
import '../core/data/models/movie_model.dart';
import '../core/data/services/ghibli_service.dart';
import '../features/fl_chart_feature/fl_chart_screen.dart'; 
import '../features/syncfusion_feature/syncfusion_screen.dart'; 
import '../features/community_charts_feature/widgets/chart_gallery.dart'; // Ajusta la ruta y el nombre
import '../features/graphic_feature/widgets/core/home_page.dart'; // Ajusta la ruta y el nombre

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
    // Descargamos los datos de la API de Ghibli al iniciar la app
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
                child: Text(
                  'Error al conectar con la API: ${snapshot.error}', 
                  textAlign: TextAlign.center
                ),
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
              // 1. Tarjeta de tu trabajo (FL Chart)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text(
                    'FL Chart (Wilson Otero)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Películas cargadas desde la API: ${movies.length}'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FlChartScreen(movies: movies),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16), // Espacio visual entre las tarjetas

              // 2. Tarjeta del trabajo de tu compañero (Syncfusion)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text(
                    'Syncfusion (Alexander chiquillo)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Películas cargadas desde la API: ${movies.length}'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SyncfusionChartsScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16), // Espacio visual

              // 3. Tarjeta del trabajo de tu segundo compañero (Community Charts)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text(
                    'Community Charts (Juan de los rios)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Películas cargadas desde la API: ${movies.length}'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Ajusta 'ChartGallery' al nombre exacto de su clase principal
                        builder: (_) => const ChartGalleryScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16), // Espacio visual

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text(
                    'Graphic (El chamo)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Películas cargadas desde la API: ${movies.length}'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(),
                      ),
                    );
                  },
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}