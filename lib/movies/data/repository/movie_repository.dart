import 'package:dartz/dartz.dart';

import 'package:clean/core/error/exception.dart';
import 'package:clean/core/error/failure.dart';
import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';

import '../datasource/movie_remote_datasours.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository(
    this.baseMovieRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Movie>>> getNowplayinMovies() async {
    final result = await baseMovieRemoteDataSource.GetNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failuer) {
      return Left(ServerFailure(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.GetPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failuer) {
      return Left(ServerFailure(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.GetTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failuer) {
      return Left(ServerFailure(failuer.errorMessageModel.statusMessage));
    }
  }
}
