import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCases {
  final BaseMovieRepository baseMovieRepositry;
  GetTopRatedMoviesUseCases(
    this.baseMovieRepositry,
  );

  Future<Either<Failure, List<Movie?>>> execute() async {
    return await baseMovieRepositry.getTopRatedMovies();
  }
}
