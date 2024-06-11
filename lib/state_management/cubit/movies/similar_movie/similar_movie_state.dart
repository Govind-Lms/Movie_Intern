part of 'similar_movie_cubit.dart';

sealed class SimilarMovieState extends Equatable {
  const SimilarMovieState();

  @override
  List<Object> get props => [];
}


class SimilarIsInitial extends SimilarMovieState {
  final String message;

  const SimilarIsInitial(this.message);
  @override
  List<Object> get props => [message];
}

class SimilarIsLoading extends SimilarMovieState {
  final String message;

  const SimilarIsLoading(this.message);
  @override
  List<Object> get props => [message];
}

class SimilarIsSuccess extends SimilarMovieState {
  final SimilarMovieModel movieModel;

  const SimilarIsSuccess(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}

class SimilarIsError extends SimilarMovieState {
  
  final String message;

  const SimilarIsError(this.message);
  @override
  List<Object> get props => [message];
}