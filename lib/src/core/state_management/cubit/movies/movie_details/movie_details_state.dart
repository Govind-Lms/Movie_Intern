part of 'movie_details_cubit.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetialsInitial extends MovieDetailsState {
  final String message;

  const MovieDetialsInitial({required this.message});
  @override
  List<Object> get props => [message];
}

final class MovieIsLoading extends MovieDetailsState{
  final String message;

  const MovieIsLoading(this.message);
  @override
  List<Object> get props => [message];
}



final class MovieIsSuccess extends MovieDetailsState{
  final MovieDetailsModel movieDetailModel;

  const MovieIsSuccess(this.movieDetailModel);
  @override
  List<Object> get props => [movieDetailModel];
}



final class MovieIsError extends MovieDetailsState{
  final String message;

  const MovieIsError(this.message);
  @override
  List<Object> get props => [message];
}

