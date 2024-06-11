part of 'upcoming_bloc.dart';

sealed class UpcomingState extends Equatable {
  final List<Movies>? movies;
  const UpcomingState({this.movies});
  
  @override
  List<Object?> get props => [movies];
}

final class UpcomingInitial extends UpcomingState {
  UpcomingInitial(): super(movies:[]);
  @override
  List<Object?> get props => [];
}

final class UpcomingLoading extends UpcomingState{
  UpcomingLoading() : super(movies: []);
  @override
  List<Object?> get props => [];
}



final class UpcomingSuccess extends UpcomingState{
  // ignore: overridden_fields, annotate_overrides
  final List<Movies>? movies;
  final PageState? pageState;
  final int? pageCount;

  const UpcomingSuccess({required this.movies, this.pageState, this.pageCount});
  @override
  List<Object?> get props => [movies,pageCount,pageState];
}



final class UpcomingError extends UpcomingState{
  final ErrorState errorState;
  final String message;

  const UpcomingError({super.movies, required this.errorState, required this.message});
  @override
  List<Object?> get props => [errorState,message];
}