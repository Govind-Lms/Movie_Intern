part of 'popular_cubit.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class IsPopularInitial extends PopularState {
  @override
  List<Object> get props => [];
}

final class IsPopularLoading extends PopularState {
  final String message;
  const IsPopularLoading(this.message);

  @override
  List<Object> get props => [message];
}

final class IsPopularSuccess extends PopularState {
  final MovieModel movies;
  // final String type;
  const IsPopularSuccess(this.movies);
  @override
  List<Object> get props => [movies];
}

final class IsPopularError extends PopularState {
  final String message;
  const IsPopularError(this.message);

  @override
  List<Object> get props => [message];
}
