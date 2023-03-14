import 'package:clean/movies/domain/entities/movie.dart';

abstract class BaseMovieRepositry {
  Future<List<Movie>> getNowplaying();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
