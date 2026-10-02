import 'dart:convert';
import 'package:flutter_charts/core/config/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class GhibliService {
  static Future<List<Movie>> fetchFilms() async {
    try {
      final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.filmsEndpoint}');
      final response = await http.get(url).timeout(ApiConstants.timeout);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Fallo de conexión al cargar el catálogo.');
    }
  }
}