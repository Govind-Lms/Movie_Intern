part of 'toprated_bloc.dart';

sealed class TopratedEvent extends Equatable {
  const TopratedEvent();

  @override
  List<Object> get props => [];

}

final class GetTopRatedMovies extends TopratedEvent{}
final class GetMoreTopRatedMovies extends TopratedEvent{}
