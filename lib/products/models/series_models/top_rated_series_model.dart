class TopRatedSeriesModel {
  List<TopRateds>? results;

  TopRatedSeriesModel({
    this.results,
  });

  TopRatedSeriesModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <TopRateds>[];
      json['results'].forEach((v) {
        results!.add(TopRateds.fromJson(v));
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

class TopRateds {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalName;
  String? overview;
  String? posterPath;
  String? firstAirDate;
  double? voteAverage;

  TopRateds({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalName,
    this.overview,
    this.posterPath,
    this.firstAirDate,
    this.voteAverage,
  });

  TopRateds.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originCountry = json['origin_country'].cast<String>();
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['origin_country'] = originCountry;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['first_air_date'] = firstAirDate;
    data['vote_average'] = voteAverage;
    return data;
  }
}
