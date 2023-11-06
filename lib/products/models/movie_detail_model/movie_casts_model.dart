class CastsModel {
  int? id;
  List<Cast>? cast;

  CastsModel({this.id, this.cast});

  CastsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  int? id;
  String? originalName;
  String? profilePath;
  String? character;

  Cast({
    this.id,
    this.originalName,
    this.profilePath,
    this.character,
  });

  Cast.fromJson(Map<String, dynamic> json) {
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
