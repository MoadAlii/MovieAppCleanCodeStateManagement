import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failuer.dart';

class GetTopRatedMoviesUseCases {
  final BaseMovieRepositry? baseMovieRepositry;
  GetTopRatedMoviesUseCases({
    this.baseMovieRepositry,
  });

  Future<Either<Failuer, List<Movie?>>> execute() async {
    return await baseMovieRepositry!.getTopRatedMovies();
  }
}
