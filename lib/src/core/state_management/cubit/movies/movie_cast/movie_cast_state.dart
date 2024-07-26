part of 'movie_cast_cubit.dart';

sealed class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

final class CastIsInitial extends MovieCastState {
  final String message;

  const CastIsInitial(this.message);
  @override
  List<Object> get props => [message];
}

final class CastIsLoading extends MovieCastState{
  final String message;
  const CastIsLoading(this.message);
  @override
  List<Object> get props => [message];
}

final class CastIsSuccess extends MovieCastState{
  final RespObj movieCastModel;
  const CastIsSuccess(this.movieCastModel);
  @override
  List<Object> get props => [movieCastModel];
}

final class CastIsError extends MovieCastState{
  final String message;
  const CastIsError(this.message);
  @override
  List<Object> get props => [message];
}
