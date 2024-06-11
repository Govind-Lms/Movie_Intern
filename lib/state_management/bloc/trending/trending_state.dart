part of 'trending_bloc.dart';

sealed class TrendingState extends Equatable {
  final List<Movies>? movies;
  const TrendingState({this.movies});
  @override
  List<Object?> get props => [];
}

final class TrendingInitial extends TrendingState {
  TrendingInitial() : super(movies: []);

  @override
  List<Object?> get props => [];
}

final class TrendingLoading extends TrendingState {
  TrendingLoading() : super(movies: []);

  @override
  List<Object?> get props => [];
}

final class TrendingSuccess extends TrendingState {
  final List<Movies>? movies;
  final PageState? pageState;
  final int? pageCount;

  const TrendingSuccess({required this.movies, required this.pageState, required this.pageCount});

  @override
  List<Object?> get props => [movies,pageCount,pageState];

}

final class TrendingError extends TrendingState {
  final ErrorState errorState;
  final String message;

  const TrendingError({required this.errorState, required this.message});

  @override
  List<Object?> get props => [errorState,message];

}
