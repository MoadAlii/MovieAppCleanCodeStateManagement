// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean/core/error/failure.dart';
import 'package:clean/core/usecase/base_usecase.dart';
import 'package:clean/movies/domain/entities/movie_details.dart';

import '../repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepositry;

  GetMovieDetailsUseCase(
    this.baseMovieRepositry,
  );

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepositry.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [];
}
