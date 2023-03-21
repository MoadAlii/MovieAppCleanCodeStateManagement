import 'package:clean/movies/data/datasource/movie_remote_datasours.dart';
import 'package:clean/movies/data/repository/movie_repository.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';
import 'package:clean/movies/domain/usecases/get_now_playing_movie_usecases.dart';
import 'package:clean/movies/presentation/controller/movies_event.dart';
import 'package:clean/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository =
          MovieRepository(baseMovieRemoteDataSource);
      final result =
          await GetNowPlayingMoviesUseCases(baseMovieRepository).execute();
    });
  }
}
