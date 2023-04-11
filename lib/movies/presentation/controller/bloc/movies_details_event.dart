// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();
}

class GetMovieDetailsEvent extends MoviesDetailsEvent {
  final int id;
  const GetMovieDetailsEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetMovieDetailsRecommendationEvent extends MoviesDetailsEvent {
  final int id;
  const GetMovieDetailsRecommendationEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
