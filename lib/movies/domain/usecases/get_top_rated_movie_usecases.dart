import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';

class TopRatedMoviesUseCases {
  final BaseMovieRepositry? baseMovieRepositry;
  TopRatedMoviesUseCases({
    this.baseMovieRepositry,
  });

  Future<List<Movie>> execute() async {
    return await baseMovieRepositry!.getTopRatedMovies();
  }
}
