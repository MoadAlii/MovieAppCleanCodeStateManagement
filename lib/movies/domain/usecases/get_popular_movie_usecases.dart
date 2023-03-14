import 'package:clean/movies/domain/entities/movie.dart';
import 'package:clean/movies/domain/repository/base_movie_repositry.dart';

class GetPopularMoviesUseCases {
  final BaseMovieRepositry? baseMovieRepositry;
  GetPopularMoviesUseCases({
    this.baseMovieRepositry,
  });

  Future<List<Movie>> execute() async {
    return await baseMovieRepositry!.getPopularMovies();
  }
}
