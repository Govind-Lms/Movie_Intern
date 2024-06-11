part of 'genre_bloc.dart';

sealed class GenreState extends Equatable {
  final List<Movies>? movies;
  const GenreState({this.movies});

  @override
  List<Object?> get props => [movies];
}

final class GenreInitial extends GenreState {
  GenreInitial() : super(movies: []);
  @override
  List<Object?> get props => [];
}

final class GenreLoading extends GenreState {
  GenreLoading() : super(movies: []);
  @override
  List<Object?> get props => [];
}

final class GenreError extends GenreState {
  final ErrorState errorState;
  final String message;
  const GenreError(this.errorState, this.message);
  @override
  List<Object?> get props => [message, errorState];
}

final class GenreSuccess extends GenreState {
  final List<Movies>? movie;
  final PageState? pageState;
  final int? pageCount;
  const GenreSuccess({this.movie, this.pageState, this.pageCount}): super(movies: movie);

  @override
  List<Object?> get props => [movie, pageState, pageCount];
}
