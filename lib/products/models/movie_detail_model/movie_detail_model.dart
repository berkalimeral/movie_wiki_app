class MovieDetailModel {
  int? budget;
  List<Genres>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? tagline;
  String? title;
  double? voteAverage;

  MovieDetailModel({
    this.budget,
    this.genres,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.tagline,
    this.title,
    this.voteAverage,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['tagline'] = tagline;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
