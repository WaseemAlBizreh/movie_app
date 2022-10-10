class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "156aa418f2e1e758445fbab21421e596";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String movieDetailsPath(int movieId) {
    return "$baseUrl/movie/$movieId?api_key=$apiKey";
  }

  static String movieRecommendationPath(int movieId) {
    return "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  }

  static String imageUrl(String path) {
    return '$baseImageUrl$path';
  }
}
