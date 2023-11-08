class SeriesCreditsModel {
  List<SeriesCreditCast>? cast;

  SeriesCreditsModel({this.cast});

  SeriesCreditsModel.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <SeriesCreditCast>[];
      json['cast'].forEach((v) {
        cast!.add(SeriesCreditCast.fromJson(v));
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

class SeriesCreditCast {
  String? backdropPath;
  int? id;
  String? originalName;
  String? name;
  String? character;

  SeriesCreditCast(
      {this.backdropPath,
      this.id,
      this.originalName,
      this.name,
      this.character});

  SeriesCreditCast.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalName = json['original_name'];
    name = json['name'];
    character = json['character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_name'] = originalName;
    data['name'] = name;
    data['character'] = character;
    return data;
  }
}
