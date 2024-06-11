part of 'search_movie_cubit.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

final class SearchIsInitial extends SearchMovieState {
  final String message;

  const SearchIsInitial(this.message);

  @override
  List<Object> get props => [message];
}

final class SearchIsLoading extends SearchMovieState {
  final String message;

  const SearchIsLoading(this.message);

  @override
  List<Object> get props => [message];
}

final class SearchIsError extends SearchMovieState {
  final String message;

  const SearchIsError(this.message);

  @override
  List<Object> get props => [message];
}

final class SearchIsSuccess extends SearchMovieState {
  final SearchModel movieModel;

  const SearchIsSuccess(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}
