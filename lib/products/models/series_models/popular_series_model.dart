class PopularSeriesModel {
  List<PopularSeries>? results;

  PopularSeriesModel({
    this.results,
  });

  PopularSeriesModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <PopularSeries>[];
      json['results'].forEach((v) {
        results!.add(PopularSeries.fromJson(v));
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

class PopularSeries {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalTitle;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  PopularSeries({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalTitle,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  PopularSeries.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originCountry = json['origin_country'].cast<String>();

    originalTitle = json['original_name'];
    title = json['name'];
    overview = json['overview'];

    posterPath = json['poster_path'];
    releaseDate = json['first_air_date'];

    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['origin_country'] = originCountry;
    data['original_name'] = originalTitle;
    data['name'] = title;
    data['overview'] = overview;

    data['poster_path'] = posterPath;
    data['first_air_date'] = releaseDate;

    data['vote_average'] = voteAverage;

    return data;
  }
}
