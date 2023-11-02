class PopularMovieModel {
  List<Populars>? results;

  PopularMovieModel({
    this.results,
  });

  PopularMovieModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Populars>[];
      json['results'].forEach((v) {
        results!.add(Populars.fromJson(v));
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

class Populars {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  Populars({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  Populars.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}
