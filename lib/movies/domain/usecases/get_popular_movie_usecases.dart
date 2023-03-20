import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCases {
  final BaseMovieRepositry baseMovieRepositry;
  GetPopularMoviesUseCases(
    this.baseMovieRepositry,
  );

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepositry.getPopularMovies();
  }
}
