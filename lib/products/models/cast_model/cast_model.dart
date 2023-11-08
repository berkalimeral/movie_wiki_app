class CastModel {
  String? biography;
  String? birthday;
  int? id;
  String? name;
  String? placeOfBirth;
  String? profilePath;

  CastModel(
      {this.biography,
      this.birthday,
      this.id,
      this.name,
      this.placeOfBirth,
      this.profilePath});

  CastModel.fromJson(Map<String, dynamic> json) {
    biography = json['biography'];
    birthday = json['birthday'];
    id = json['id'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['id'] = id;
    data['name'] = name;
    data['place_of_birth'] = placeOfBirth;
    data['profile_path'] = profilePath;
    return data;
  }
}
