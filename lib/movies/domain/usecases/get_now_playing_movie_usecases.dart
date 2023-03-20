import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCases {
  final BaseMovieRepositry baseMovieRepositry;
  GetNowPlayingMoviesUseCases(
    this.baseMovieRepositry,
  );

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepositry.getNowplayinMovies();
  }
}
