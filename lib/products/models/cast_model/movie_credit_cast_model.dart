class MovieCreditsModel {
  List<MovieCreditCast>? cast;

  MovieCreditsModel({this.cast});

  MovieCreditsModel.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <MovieCreditCast>[];
      json['cast'].forEach((v) {
        cast!.add(MovieCreditCast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieCreditCast {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? title;
  String? character;

  MovieCreditCast(
      {this.backdropPath,
      this.id,
      this.originalTitle,
      this.title,
      this.character});

  MovieCreditCast.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    title = json['title'];
    character = json['character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['title'] = title;
    data['character'] = character;
    return data;
  }
}
