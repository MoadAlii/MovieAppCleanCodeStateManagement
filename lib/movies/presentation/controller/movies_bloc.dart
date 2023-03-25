import 'package:clean/core/utils/enums.dart';
import 'package:clean/movies/data/datasource/movie_remote_datasours.dart';
import 'package:clean/movies/data/repository/movie_repository.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';
import 'package:clean/movies/domain/usecases/get_now_playing_movie_usecases.dart';
import 'package:clean/movies/presentation/controller/movies_event.dart';
import 'package:clean/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCases getNowPlayingMoviesUseCases;

  MoviesBloc(this.getNowPlayingMoviesUseCases) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCases.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingState: RequestState.error,
            message: l.message,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
