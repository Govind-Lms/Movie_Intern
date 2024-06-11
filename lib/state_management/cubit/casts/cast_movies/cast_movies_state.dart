part of 'cast_movies_cubit.dart';

sealed class CastMoviesState extends Equatable {
  const CastMoviesState();

  @override
  List<Object> get props => [];
}

final class PersonMovieIsInitial extends CastMoviesState {
  final String message;
  const PersonMovieIsInitial(this.message);
  @override
  List<Object> get props => [message];
}


final class PersonMovieIsError extends CastMoviesState {
  final String message;
  const PersonMovieIsError(this.message);
  @override
  List<Object> get props => [message];
}


final class PersonMovieIsLoading extends CastMoviesState {
  final String message;
  const PersonMovieIsLoading(this.message);
  @override
  List<Object> get props => [message];
}

final class PersonMovieIsSuccess extends CastMoviesState {
  final CastMovieModel castInfoModel;
  const PersonMovieIsSuccess(this.castInfoModel);
  @override
  List<Object> get props => [castInfoModel];
}
