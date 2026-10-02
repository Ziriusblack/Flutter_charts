class Movie {
  final String id;
  final String title;
  final String originalTitleRomanised;
  final String description;
  final String director;
  final String producer;
  final int releaseDate;      // Cambiado a int
  final double runningTime;   // Cambiado a double (fl_chart usa doubles)
  final double rtScore;       // Cambiado a double
  final String image;
  final String movieBanner;

  Movie({
    required this.id,
    required this.title,
    required this.originalTitleRomanised,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
    required this.image,
    required this.movieBanner,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? 'Sin título',
      originalTitleRomanised: json['original_title_romanised'] ?? '',
      description: json['description'] ?? 'Sin descripción disponible',
      director: json['director'] ?? 'Desconocido',
      producer: json['producer'] ?? 'Desconocido',
      
      // Parseamos los strings a números automáticamente
      releaseDate: int.tryParse(json['release_date']?.toString() ?? '0') ?? 0,
      runningTime: double.tryParse(json['running_time']?.toString() ?? '0') ?? 0.0,
      rtScore: double.tryParse(json['rt_score']?.toString() ?? '0') ?? 0.0,
      
      image: json['image'] ?? '',
      movieBanner: json['movie_banner'] ?? '',
    );
  }
}