import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCases {
  final BaseMovieRepository baseMovieRepositry;
  GetPopularMoviesUseCases(
    this.baseMovieRepositry,
  );

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepositry.getPopularMovies();
  }
}
