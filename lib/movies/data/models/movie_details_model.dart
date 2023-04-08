import 'package:clean/movies/domain/entities/movie_details.dart';
import 'package:flutter/foundation.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          genres: List<GenresModel>.from(
              json['genres'].map((x) => GenresModel.fromJson(x))),
          id: json["id"],
          overview: json['overview'],
          releaseDate: json['release_date'],
          runtime: json['runtime'],
          title: json['title'],
          voteAverage: json['vote_average']);
}
