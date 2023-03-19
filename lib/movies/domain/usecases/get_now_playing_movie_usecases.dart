import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failuer.dart';

class GetNowPlayingMoviesUseCases {
  final BaseMovieRepositry? baseMovieRepositry;
  GetNowPlayingMoviesUseCases({
    this.baseMovieRepositry,
  });

  Future<Either<Failuer, List<Movie?>>> execute() async {
    return await baseMovieRepositry!.getNowplayinMovies();
  }
}
