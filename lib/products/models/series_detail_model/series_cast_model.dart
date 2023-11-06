class SeriesCastModel {
  List<SeriesCast>? cast;
  int? id;

  SeriesCastModel({this.cast, this.id});

  SeriesCastModel.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <SeriesCast>[];
      json['cast'].forEach((v) {
        cast!.add(SeriesCast.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}

class SeriesCast {
  int? id;
  String? originalName;
  String? profilePath;
  String? character;

  SeriesCast({this.id, this.originalName, this.profilePath, this.character});

  SeriesCast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalName = json['original_name'];
    profilePath = json['profile_path'];
    character = json['character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['original_name'] = originalName;
    data['profile_path'] = profilePath;
    data['character'] = character;
    return data;
  }
}
