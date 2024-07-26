part of 'nowplaying_cubit.dart';

sealed class NowplayingState extends Equatable {
  const NowplayingState();

  @override
  List<Object> get props => [];
}

final class NowplayingInitial extends NowplayingState {

  @override
  List<Object> get props => [];
}

final class NowplayingIsLoading extends NowplayingState{
  final String message;

  const NowplayingIsLoading(this.message);
  @override
  List<Object> get props => [message];
}
final class NowplayingSuccess extends NowplayingState{
  // final MovieModel? movieModel;
  final RespObj respObj;
  const NowplayingSuccess( this.respObj);
  @override
  List<Object> get props => [respObj];
}


final class NowplayingError extends NowplayingState{

  final ErrorState errorState;
  final String message;
  const NowplayingError(this.errorState,this.message);
  @override
  List<Object> get props => [errorState,message];
}