import 'package:clean/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failuer.dart';

abstract class BaseMovieRepositry {
  Future<Either<Failuer, List<Movie?>>> getNowplayinMovies();
  Future<Either<Failuer, List<Movie?>>> getPopularMovies();
  Future<Either<Failuer, List<Movie?>>> getTopRatedMovies();
}
