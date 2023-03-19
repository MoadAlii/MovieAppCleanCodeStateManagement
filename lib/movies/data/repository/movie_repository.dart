import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';

import '../datasource/movie_remote_datasours.dart';

import 'package:dartz/dartz.dart';

class MovieRepository extends BaseMovieRepositry {
  final BaseMovieRemoteDataSource? baseMovieRemoteDataSource;
  MovieRepository({
    this.baseMovieRemoteDataSource,
  });

  @override
  Future<List<Movie>> getNowplayinMovies() {}

  @override
  Future<List<Movie>> getPopularMovies() {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    throw UnimplementedError();
  }
}
