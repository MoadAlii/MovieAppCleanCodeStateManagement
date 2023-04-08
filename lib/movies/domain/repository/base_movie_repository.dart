import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/entities/movie_details.dart';
import 'package:clean/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowplayinMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
}
