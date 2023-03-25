import 'package:clean/movies/data/datasource/movie_remote_datasours.dart';
import 'package:clean/movies/data/repository/movie_repository.dart';
import 'package:clean/movies/domain/repository/base_movie_repository.dart';
import 'package:clean/movies/domain/usecases/get_now_playing_movie_usecases.dart';
import 'package:clean/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Bloc

    sl.registerFactory(() => MoviesBloc(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCases(sl()));

    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
