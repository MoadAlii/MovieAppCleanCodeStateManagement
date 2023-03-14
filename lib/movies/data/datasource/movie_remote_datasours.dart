import 'package:clean/core/error/exception.dart';
import 'package:clean/core/utils/app_constance.dart';
import 'package:clean/movies/data/models/movie_model.dart';
import 'package:clean/movies/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../../core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> GetNowPlayingMovies();
  Future<List<MovieModel>> GetPopularMovies();
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
  Future<List<MovieModel>> GetPopularMovies() {}
}
