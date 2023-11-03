class MovieGenresModel {
  List<MovieGenres>? genres;

  MovieGenresModel({this.genres});

  MovieGenresModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <MovieGenres>[];
      json['genres'].forEach((v) {
        genres!.add(MovieGenres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieGenres {
  int? id;
  String? name;

  MovieGenres({this.id, this.name});

  MovieGenres.fromJson(Map<String, dynamic> json) {
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
