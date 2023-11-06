
class SimilarModel {
  List<SimilarMovie>? results;

  SimilarModel({
    this.results,
  });

  SimilarModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SimilarMovie>[];
      json['results'].forEach((v) {
        results!.add(SimilarMovie.fromJson(v));
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

class SimilarMovie {
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;

  SimilarMovie({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
  });

  SimilarMovie.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_title'] = originalTitle;
    return data;
  }
}
