part of 'now_playing_bloc.dart';

sealed class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();

  @override
  List<Object> get props => [];
}


final class GetNowPlaying extends NowPlayingEvent {

}

final class GetMoreNowPlaying extends NowPlayingEvent {
  
}