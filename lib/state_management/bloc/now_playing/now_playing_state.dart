part of 'now_playing_bloc.dart';

sealed class NowPlayingState extends Equatable {
  final List<Movies>? movies;
  const NowPlayingState({this.movies});

  @override
  List<Object?> get props => [movies];
}

final class NowPlayingInitial extends NowPlayingState {
  NowPlayingInitial(): super(movies: []);
  @override
  List<Object?> get props => [];
}

final class NowPlayingIsLoading extends NowPlayingState{
  NowPlayingIsLoading(): super(movies: []);
  @override
  List<Object?> get props => [];
}

final class NowPlayingSuccess extends NowPlayingState{
  // ignore: annotate_overrides, overridden_fields
  final List<Movies>? movies;
  final PageState? pageState;
  final int? pageCount;
  const NowPlayingSuccess({this.movies, this.pageState, this.pageCount}): super(movies: movies);
  
  @override
  List<Object?> get props => [movies, pageState, pageCount];
}

final class NowPlayingError extends NowPlayingState{
  final ErrorState errorState;
  final String message;
  const NowPlayingError(this.errorState,this.message);
  @override
  List<Object> get props => [errorState,message];
}
