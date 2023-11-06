class SeriesSimilarModel {
  List<SimilarSeries>? results;

  SeriesSimilarModel({this.results});

  SeriesSimilarModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SimilarSeries>[];
      json['results'].forEach((v) {
        results!.add(SimilarSeries.fromJson(v));
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

class SimilarSeries {
  String? backdropPath;
  int? id;
  String? originalName;

  SimilarSeries({this.backdropPath, this.id, this.originalName});

  SimilarSeries.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_name'] = originalName;
    return data;
  }
}
