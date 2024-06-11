part of 'toprated_bloc.dart';

sealed class TopratedState extends Equatable {
  final List<Movies>? movies;
  const TopratedState({this.movies});
  
  @override
  List<Object?> get props => [movies];
}

final class TopratedInitial extends TopratedState {
  TopratedInitial(): super(movies:[]);
  @override
  List<Object?> get props => [];
}

final class TopratedLoading extends TopratedState{
  TopratedLoading() : super(movies: []);
  @override
  List<Object?> get props => [];
}



final class TopratedSuccess extends TopratedState{
  // ignore: overridden_fields, annotate_overrides
  final List<Movies>? movies;
  final PageState? pageState;
  final int? pageCount;

  const TopratedSuccess({required this.movies, this.pageState, this.pageCount});
  @override
  List<Object?> get props => [movies,pageCount,pageState];
}



final class TopratedError extends TopratedState{
  final ErrorState errorState;
  final String message;

  const TopratedError({super.movies, required this.errorState, required this.message});
  @override
  List<Object?> get props => [errorState,message];
}