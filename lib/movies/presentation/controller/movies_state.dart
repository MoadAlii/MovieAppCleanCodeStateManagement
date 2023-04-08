import 'package:equatable/equatable.dart';

import 'package:clean/core/utils/enums.dart';
import 'package:clean/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;

  final List<Movie> populerMovies;
  final RequestState populerState;
  final String messagePopluler;

  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String messageTopRated;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loaded,
    this.message = "",
    this.populerMovies = const [],
    this.populerState = RequestState.loaded,
    this.messagePopluler = "",
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loaded,
    this.messageTopRated = "",
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? message,
    List<Movie>? populerMovies,
    RequestState? populerState,
    String? messagePopluler,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? messageTopRated,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      message: message ?? this.message,
      populerMovies: populerMovies ?? this.populerMovies,
      populerState: populerState ?? this.populerState,
      messagePopluler: messagePopluler ?? this.messagePopluler,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      messageTopRated: messageTopRated ?? this.messageTopRated,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
        populerMovies,
        populerState,
        messagePopluler,
        topRatedMovies,
        topRatedState,
        messageTopRated,
      ];
}
