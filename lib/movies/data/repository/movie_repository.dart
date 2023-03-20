import 'package:clean/core/error/exception.dart';
import 'package:clean/core/error/failuer.dart';
import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';

import '../datasource/movie_remote_datasours.dart';

import 'package:dartz/dartz.dart';

class MovieRepository extends BaseMovieRepositry {
  final BaseMovieRemoteDataSource? baseMovieRemoteDataSource;
  MovieRepository(
    BaseMovieRemoteDataSource baseMovieRemoteDataSource, {
    this.baseMovieRemoteDataSource,
  });

  @override
  Future<Either<Failuer, List<Movie>>> getNowplayinMovies() async {
    final result = await baseMovieRemoteDataSource?.GetNowPlayingMovies();
    try {
      return Right(result!);
    } on ServerException catch (failuer) {
      return Left(ServerFailuer(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failuer, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource?.GetPopularMovies();
    try {
      return Right(result!);
    } on ServerException catch (failuer) {
      return Left(ServerFailuer(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failuer, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource?.GetTopRatedMovies();
    try {
      return Right(result!);
    } on ServerException catch (failuer) {
      return Left(ServerFailuer(failuer.errorMessageModel.statusMessage));
    }
  }
}
