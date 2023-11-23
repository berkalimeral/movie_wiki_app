class EndPointsMovie {
  static const String nowPlaying = '/3/movie/now_playing';
  static const String popular = '/3/movie/popular';
  static const String trending = '/3/trending/movie/day';
  static const String genre = '/3/genre/movie/list';
  static const String search = '/3/search/movie';

  static String movieDetail(id) => '/3/movie/$id';
  static String actors(id) => '/3/movie/$id/credits';
  static String similar(id) => '/3/movie/$id/similar';
  static String credits(id) => '/3/person/$id/movie_credits';
}

class EndPointsSeries {
  static const String topRated = '/3/tv/top_rated';
  static const String trending = '/3/trending/tv/day';
  static const String popular = '/3/tv/popular';
  static const String genre = '/3/genre/tv/list';

  static String seriesDetail(id) => '/3/tv/$id';
  static String actors(id) => '/3/tv/$id/credits';
  static String similar(id) => '/3/tv/$id/similar';
  static String credit(id) => '/3/person/$id/tv_credits';
}

class EndPointsBoth {
  static const String movieGenres = '/3/genre/movie/list';
  static const String seriesGenres = '/3/genre/tv/list';
  static String casts(id) => '/3/person/$id';
}

class EndPointsAuth {
  static const String authToken = '/3/authentication/token/new';
  static const String createSession = '/3/authentication/session/new';
  static const String deleteSession = '/3/authentication/session';
  static const String validateWithLogin =
      '/3/authentication/token/validate_with_login';
}
