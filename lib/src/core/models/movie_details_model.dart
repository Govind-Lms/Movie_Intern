import 'package:hive/hive.dart';
part "movie_details_model.g.dart";

@HiveType(typeId: 0)
class MovieDetailsModel extends HiveObject {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  int? budget;
  @HiveField(3)
  List<Genres>? genres;
  @HiveField(4)
  String? homepage;
  @HiveField(5)
  int? id;
  @HiveField(6)
  String? imdbId;
  @HiveField(7)
  List<String>? originCountry;
  @HiveField(8)
  String? originalLanguage;
  @HiveField(9)
  String? originalTitle;
  @HiveField(10)
  String? overview;
  @HiveField(11)
  double? popularity;
  @HiveField(12)
  String? posterPath;
  @HiveField(13)
  List<ProductionCompanies>? productionCompanies;
  @HiveField(14)
  List<ProductionCountries>? productionCountries;
  @HiveField(15)
  String? releaseDate;
  @HiveField(16)
  int? revenue;
  @HiveField(17)
  int? runtime;
  @HiveField(18)
  List<SpokenLanguages>? spokenLanguages;
  @HiveField(19)
  String? status;
  @HiveField(20)
  String? tagline;
  @HiveField(21)
  String? title;
  @HiveField(22)
  bool? video;
  @HiveField(23)
  double? voteAverage;
  @HiveField(24)
  int? voteCount;
  @HiveField(25)
  Videos? videos;

  MovieDetailsModel(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originCountry,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.videos});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    videos =
        json['videos'] != null ? Videos.fromJson(json['videos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['origin_country'] = originCountry;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    if (videos != null) {
      data['videos'] = videos!.toJson();
    }
    return data;
  }
}
@HiveType(typeId: 1)
class Genres extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
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
@HiveType(typeId: 2)
class ProductionCompanies extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? logoPath;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}
@HiveType(typeId: 3)
class ProductionCountries extends HiveObject{
  @HiveField(0)
  String? iso31661;
  @HiveField(1)
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}
@HiveType(typeId: 4)
class SpokenLanguages extends HiveObject {
  @HiveField(0)
  String? englishName;
  @HiveField(1)
  String? iso6391;
  @HiveField(2)
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    return data;
  }
}
@HiveType(typeId: 5)
class Videos extends HiveObject{
  @HiveField(0)
  List<VideoResults>? results;
  @HiveField(1)
  Videos({this.results});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <VideoResults>[];
      json['results'].forEach((v) {
        results!.add(VideoResults.fromJson(v));
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
@HiveType(typeId: 6)
class VideoResults extends HiveObject{
  @HiveField(0)
  String? iso6391;
  @HiveField(1)
  String? iso31661;
  @HiveField(2)
  String? name;
  @override
  @HiveField(3)
  String? key;
  @HiveField(4)
  String? site;
  @HiveField(5)
  int? size;
  @HiveField(6)
  String? type;
  @HiveField(7)
  bool? official;
  @HiveField(8)
  String? publishedAt;
  @HiveField(9)
  String? id;

  VideoResults(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  VideoResults.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    data['key'] = key;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['published_at'] = publishedAt;
    data['id'] = id;
    return data;
  }
}
