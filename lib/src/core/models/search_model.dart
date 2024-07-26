// class SearchModel {
//   int? page;
//   List<Result>? results;
//   int? totalPages;
//   int? totalResults;
//   SearchModel({this.page, this.results, this.totalPages, this.totalResults});
//   factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
//       page: json["page"],
//       results: json["results"] == null
//           ? []
//           : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
//       totalPages: json["total_pages"],
//       totalResults: json["total_results"]);
// }

// class Result {
//   int? id;
//   int? voteCount;
//   bool? video;
//   double? voteAverage;
//   String? title;
//   double? popularity;
//   String? posterPath;
//   String? originalLanguage;
//   String? originalTitle;
//   List<int>? genreIds;
//   String? backdropPath;
//   bool? adult;
//   String? overview;
//   String? releaseDate;
//   Result(
//       {this.adult,
//       this.backdropPath,
//       this.genreIds,
//       this.id,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.releaseDate,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount});
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//       adult: json["adult"],
//       backdropPath: json["backdrop_path"],
//       genreIds: json["genre_ids"] == null
//           ? []
//           : List<int>.from(json["genre_ids"]!.map((x) => x)),
//       id: json["id"],
//       originalLanguage: json["original_language"],
//       originalTitle: json["original_title"]!,
//       overview: json["overview"],
//       popularity: json["popularity"]?.toDouble(),
//       posterPath: json["poster_path"],
//       releaseDate: json["release_date"],
//       title: json["title"]!,
//       video: json["video"],
//       voteAverage: json["vote_average"]?.toDouble(),
//       voteCount: json["vote_count"]);
// }
