class TrendsSeriesModel {
  List<TrendsSeries>? results;

  TrendsSeriesModel({
    this.results,
  });

  TrendsSeriesModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <TrendsSeries>[];
      json['results'].forEach((v) {
        results!.add(TrendsSeries.fromJson(v));
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

class TrendsSeries {
  String? backdropPath;
  int? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  List<int>? genreIds;
  String? firstAirDate;
  double? voteAverage;
  List<String>? originCountry;

  TrendsSeries(
      {this.backdropPath,
      this.id,
      this.name,
      this.originalName,
      this.overview,
      this.posterPath,
      this.genreIds,
      this.firstAirDate,
      this.voteAverage,
      this.originCountry});

  TrendsSeries.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    genreIds = json['genre_ids'].cast<int>();
    firstAirDate = json['first_air_date'];
    voteAverage = json['vote_average'];
    originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['genre_ids'] = genreIds;
    data['first_air_date'] = firstAirDate;
    data['vote_average'] = voteAverage;
    data['origin_country'] = originCountry;
    return data;
  }
}
