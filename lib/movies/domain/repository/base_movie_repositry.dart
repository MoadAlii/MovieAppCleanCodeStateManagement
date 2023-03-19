import 'package:clean/movies/domain/entities/movie.dart';

abstract class BaseMovieRepositry {
  Future<List<Movie>> getNowplayinMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
