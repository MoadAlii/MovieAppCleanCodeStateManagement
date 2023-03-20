import 'package:clean/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepositry {
  Future<Either<Failure, List<Movie>>> getNowplayinMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
