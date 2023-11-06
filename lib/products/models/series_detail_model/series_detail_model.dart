class SeriesDetailModel {
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<Genres>? genres;
  int? id;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  List<Networks>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  String? originalName;
  String? overview;
  String? posterPath;
  List<Seasons>? seasons;
  List<SpokenLanguages>? spokenLanguages;
  double? voteAverage;

  SeriesDetailModel(
      {this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.id,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originalName,
      this.overview,
      this.posterPath,
      this.seasons,
      this.spokenLanguages,
      this.voteAverage});

  SeriesDetailModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = <CreatedBy>[];
      json['created_by'].forEach((v) {
        createdBy!.add(CreatedBy.fromJson(v));
      });
    }
    episodeRunTime = json['episode_run_time'].cast<int>();
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    id = json['id'];
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    if (json['networks'] != null) {
      networks = <Networks>[];
      json['networks'].forEach((v) {
        networks!.add(Networks.fromJson(v));
      });
    }
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    if (createdBy != null) {
      data['created_by'] = createdBy!.map((v) => v.toJson()).toList();
    }
    data['episode_run_time'] = episodeRunTime;
    data['first_air_date'] = firstAirDate;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['last_air_date'] = lastAirDate;
    if (lastEpisodeToAir != null) {
      data['last_episode_to_air'] = lastEpisodeToAir!.toJson();
    }
    data['name'] = name;
    if (networks != null) {
      data['networks'] = networks!.map((v) => v.toJson()).toList();
    }
    data['number_of_episodes'] = numberOfEpisodes;
    data['number_of_seasons'] = numberOfSeasons;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['vote_average'] = voteAverage;
    return data;
  }
}

class CreatedBy {
  int? id;
  String? name;
  String? profilePath;

  CreatedBy({this.id, this.name, this.profilePath});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profile_path'] = profilePath;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
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

class LastEpisodeToAir {
  int? id;
  String? name;
  String? overview;
  double? voteAverage;
  String? airDate;
  int? episodeNumber;
  int? runtime;
  int? seasonNumber;
  String? stillPath;

  LastEpisodeToAir(
      {this.id,
      this.name,
      this.overview,
      this.voteAverage,
      this.airDate,
      this.episodeNumber,
      this.runtime,
      this.seasonNumber,
      this.stillPath});

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    stillPath = json['still_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['overview'] = overview;
    data['vote_average'] = voteAverage;
    data['air_date'] = airDate;
    data['episode_number'] = episodeNumber;
    data['runtime'] = runtime;
    data['season_number'] = seasonNumber;
    data['still_path'] = stillPath;
    return data;
  }
}

class Networks {
  int? id;
  String? logoPath;
  String? name;

  Networks({this.id, this.logoPath, this.name});

  Networks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    return data;
  }
}

class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? posterPath;
  double? voteAverage;

  Seasons(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.posterPath,
      this.voteAverage});

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_date'] = airDate;
    data['episode_count'] = episodeCount;
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
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
