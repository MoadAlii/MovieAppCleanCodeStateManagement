import 'dart:async';

import 'package:clean/core/usecase/base_usecase.dart';
import 'package:clean/core/utils/enums.dart';
import 'package:clean/movies/domain/usecases/get_now_playing_movie_usecases.dart';
import 'package:clean/movies/domain/usecases/get_popular_movie_usecases.dart';
import 'package:clean/movies/domain/usecases/get_top_rated_movie_usecases.dart';
import 'package:clean/movies/presentation/controller/movies_event.dart';
import 'package:clean/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCases getNowPlayingMoviesUseCases;
  final GetPopularMoviesUseCases getPopularMoviesUseCases;
  final GetTopRatedMoviesUseCases getTopRatedMoviesUseCases;

  MoviesBloc(this.getNowPlayingMoviesUseCases, this.getPopularMoviesUseCases,
      this.getTopRatedMoviesUseCases)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_GetNowPlaying);

    on<GetPopularMoviesEvent>(_GetPoularMovies);

    on<GetTopRatedMoviesEvent>(_GetTopRatedMovies);
  }

  FutureOr<void> _GetNowPlaying(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCases(NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error, message: l.message)),
      (r) => emit(state.copyWith(
          nowPlayingMovies: r, nowPlayingState: RequestState.loaded)),
    );
  }

  FutureOr<void> _GetPoularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCases(NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        populerState: RequestState.error,
        messagePopluler: l.message,
      )),
      (r) => emit(state.copyWith(
        populerMovies: r,
        populerState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _GetTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCases(NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        populerState: RequestState.error,
        messagePopluler: l.message,
      )),
      (r) => emit(state.copyWith(
        topRatedMovies: r,
        topRatedState: RequestState.loaded,
      )),
    );
  }
}
