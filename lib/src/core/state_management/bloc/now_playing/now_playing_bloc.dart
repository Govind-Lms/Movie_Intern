import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
import 'package:movie_intern/src/core/repositories/category_repository.dart';
import '../../../models/movie_model.dart';
part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingInitial()) {
    on<GetNowPlaying>(getNowPlaying);
    on<GetMoreNowPlaying>(getMoreNowPlaying);
  }

  int _totalPage = 0;
  int _page = 0;
  
  final nowPlayingRepo = CategoryRepository();

  Future<void> getNowPlaying(GetNowPlaying event, emit) async {
    _page = 1;
    emit(NowPlayingIsLoading());
    final response = await nowPlayingRepo.getRequiredMoviesLists("now_playing",_page);
    if (response.apiState == ApiState.success) {
      MovieModel md = MovieModel.fromJson(response.data);
      _totalPage = md.totalPages;
      emit(NowPlayingSuccess(movies: md.movies, pageState: PageState.loaded, pageCount: _page));
    }else {
      emit(NowPlayingError(response.errorState ?? ErrorState.unknown, response.data.toString()));
    }
  }

  Future<void> getMoreNowPlaying(GetMoreNowPlaying event, emit) async {
    _page++;
    if(_page <= _totalPage) {
      final response = await nowPlayingRepo.getRequiredMoviesLists("now_playing",_page);
      if (response.apiState == ApiState.success) {
        MovieModel md = MovieModel.fromJson(response.data);
        emit(NowPlayingSuccess(movies: state.movies?..addAll(md.movies), pageState: PageState.loadMore, pageCount: _page));
      }else {
        emit(NowPlayingError(response.errorState ?? ErrorState.unknown, response.data.toString()));
      }
    }else{
      emit(NowPlayingSuccess(movies: state.movies, pageState: PageState.noMore));
    }
  }
}
