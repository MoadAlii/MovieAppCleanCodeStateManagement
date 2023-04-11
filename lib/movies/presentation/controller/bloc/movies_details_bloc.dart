
import 'package:clean/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import 'movies_details_state.dart';

part 'movies_details_event.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMovieDetailsUseCase) : super(const MoviesDetailsState()) {
    on<GetMovieDetailsEvent>(_getMoviesDetails);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

Future<void> _getMoviesDetails(GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit)async {

final result = await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id,
));


 result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetails: r,
        movieDetailsState: RequestState.loaded,
      )),
    );

}
}

