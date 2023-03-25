import 'package:equatable/equatable.dart';

import 'package:clean/core/utils/enums.dart';
import 'package:clean/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = "",
  });

  @override
  List<Object?> get props => [];
}
