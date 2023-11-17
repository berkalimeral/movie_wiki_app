import '../../local_db/db_service/model/movie_table.dart';
import '../movie_models/movie_genres_model.dart';

class MovieDetailModel {
  int? budget;
  List<SpokenLanguages>? spokenLanguages;
  List<Genres>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? id;
  int? revenue;
  int? runtime;
  String? tagline;
  String? title;
  double? voteAverage;

  MovieDetailModel({
    this.budget,
    this.spokenLanguages,
    this.genres,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.id,
    this.revenue,
    this.runtime,
    this.tagline,
    this.title,
    this.voteAverage,
  });

  MovieTable toMovieDetail(MovieDetailModel? movie) {
    return MovieTable(
      id: movie?.id,
      title: movie?.title,
      posterPath: movie?.posterPath,
    );
  }

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    budget = json['budget'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
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
    id = json['id'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['budget'] = budget;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['id'] = id;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['tagline'] = tagline;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}

class SpokenLanguages {
  String? englishName;
  String? name;

  SpokenLanguages({this.englishName, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['name'] = name;
    return data;
  }
}
