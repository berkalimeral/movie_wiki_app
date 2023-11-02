class EndPointsMovie {
  static const String nowPlaying = '/3/movie/now_playing';
  static const String popular = '/3/movie/popular';
  static const String trending = '/3/trending/movie/day';
  static const String genre = '/3/genre/movie/list';

  static String movieDetail(id) => '/3/movie/$id';
  static String actors(id) => '/3/movie/$id/credits';
}

class EndPointsSeries {
  static const String trending = '/3/trending/tv/day';
  static const String popular = '/3/tv/popular';
  static const String genre = '/3/genre/tv/list';

  static String movieDetail(id) => '/3/tv/$id';
  static String actors(id) => '/3/tv/$id/credits';
}

class EndPointsGenres {
  static const String movieGenres = '/3/genre/movie/list';
  static const String seriesGenres = '/3/genre/tv/list';
}
