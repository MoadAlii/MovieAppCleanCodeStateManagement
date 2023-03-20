class AppConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '110b43e411eb0543b6fda80ef4323761';

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  // Tv Shows Url
  static const String nowPlayingTvShowsPath =
      "$baseUrl/tv/on_the_air?api_key=$apiKey";

  static const String popularTvShowsPath =
      "$baseUrl/tv/popular?api_key=$apiKey";

  static const String topRatedTvShowsPath =
      "$baseUrl/3/tv/top_rated?api_key=$apiKey";
}
