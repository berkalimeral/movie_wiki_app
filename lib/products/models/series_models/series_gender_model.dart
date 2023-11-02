class SeriesGenresModel {
  List<SeriesGenres>? genres;

  SeriesGenresModel({this.genres});

  SeriesGenresModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <SeriesGenres>[];
      json['genres'].forEach((v) {
        genres!.add(SeriesGenres.fromJson(v));
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

class SeriesGenres {
  int? id;
  String? name;

  SeriesGenres({this.id, this.name});

  SeriesGenres.fromJson(Map<String, dynamic> json) {
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
