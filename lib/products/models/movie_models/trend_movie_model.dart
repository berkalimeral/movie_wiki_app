class TrendMovieModel {
  List<Trends>? results;

  TrendMovieModel({
    this.results,
  });

  TrendMovieModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Trends>[];
      json['results'].forEach((v) {
        results!.add(Trends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trends {
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  List<int>? genreIds;
  String? releaseDate;
  double? voteAverage;

  Trends({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.genreIds,
    this.releaseDate,
    this.voteAverage,
  });

  Trends.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];

    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];

    genreIds = json['genre_ids'].cast<int>();

    releaseDate = json['release_date'];

    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;

    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;

    data['genre_ids'] = genreIds;

    data['release_date'] = releaseDate;

    data['vote_average'] = voteAverage;

    return data;
  }
}
