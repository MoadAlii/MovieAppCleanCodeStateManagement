import 'package:clean/core/usecase/base_usecase.dart';
import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCases extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepositry;
  GetTopRatedMoviesUseCases(
    this.baseMovieRepositry,
  );

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepositry.getTopRatedMovies();
  }
}
