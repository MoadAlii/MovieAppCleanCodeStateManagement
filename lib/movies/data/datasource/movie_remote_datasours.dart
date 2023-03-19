import 'package:clean/core/error/exception.dart';
import 'package:clean/core/utils/app_constance.dart';
import 'package:clean/movies/data/models/movie_model.dart';
import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/usecases/get_popular_movie_usecases.dart';
import 'package:clean/movies/domain/usecases/get_top_rated_movie_usecases.dart';
import 'package:dio/dio.dart';

import '../../../core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> GetNowPlayingMovies();
  Future<List<MovieModel>> GetPopularMovies();
  Future<List<MovieModel>> GetTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> GetNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["result"] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> GetPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["result"] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> GetTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["result"] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
