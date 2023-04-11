import 'package:clean/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });

  factory MovieModel.fromjson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'].toString(),
        overview: json['overview'],
        voteAverage: json["vote_average"],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        releaseDate: json['release_date'],
      );
}
