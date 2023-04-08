import 'package:clean/core/error/exception.dart';
import 'package:clean/core/utils/app_constance.dart';
import 'package:clean/movies/data/models/movie_details_model.dart';
import 'package:clean/movies/data/models/movie_model.dart';
import 'package:clean/movies/domain/entities/movie_details.dart';
import 'package:clean/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:dio/dio.dart';

import '../../../core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> GetNowPlayingMovies();
  Future<List<MovieModel>> GetPopularMovies();
  Future<List<MovieModel>> GetTopRatedMovies();
  Future<MovieDetailsModel> GetMovieDetails(MovieDetailsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> GetNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> GetPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> GetTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> GetMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstance.moviesDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
