import 'package:equatable/equatable.dart';
class MovieModel extends Equatable {
  final int page;
  // final List<DateClass> dates;
  final List<Movies> movies;
  final int totalPages;
  final int totalResult;

  const MovieModel({
    // required this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResult,
  });

  factory MovieModel.fromJson(Map<String, dynamic> result) {
    return MovieModel(
      page: result['page'],
      movies: List.from(result['results']).map((e) => Movies.parserFromJson(e)).toList(),
      // movies:
      //     result['results'].map((e) => Movies.parserFromJson(e as Map<String, dynamic>))?.toList(),
      totalPages: result['total_pages'],
      totalResult: result['total_results'],
    );
  }

  @override
  List<Object> get props => [page, movies, totalPages, totalResult];
}

class DateClass extends Equatable {
  final String minimum;
  final String maximum;

  const DateClass({required this.minimum, required this.maximum});

  factory DateClass.fromJson(Map<String, dynamic> date) {
    return DateClass(
      minimum: date['minimum'],
      maximum: date['maximum'],
    );
  }

  @override
  List<Object?> get props => [minimum, maximum];
}

class Movies  {
  int? id;
  int? voteCount;
  bool? video;
  double? voteAverage;
  String? title;
  double? popularity;
  String? posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  Movies({
    this.id,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Movies.parserFromJson(Map<String, dynamic> result) {
    return Movies(
      id: result['id'],
      voteCount: result['vote_count'],
      video: result['video'],
      voteAverage: double.parse(result['vote_average'].toString()),
      title: result['title'],
      popularity: result['popularity'],
      posterPath: result['poster_path'],
      originalTitle: result['original_title'],
      originalLanguage: result['original_language'],
      backdropPath: result['backdrop_path'],
      adult: result['adult'],
      overview: result['overview'],
      releaseDate: result['release_date'],
      genreIds: List<int>.from(result['genre_ids']),
    );
  }
}
