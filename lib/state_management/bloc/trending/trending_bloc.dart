import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/models/movie_model.dart';
import 'package:movie_intern/repositories/trending_repository.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial()) {
    on<GetTrendingMoviesEvent>(getTrendingMovies);
  }
  int _page = 0;
  int _totalPage = 0;

  final trendingRepo = TrendingRepository();

  Future<void> getTrendingMovies(GetTrendingMoviesEvent event, emit)async{
    _page =1;
    emit(TrendingLoading());
    final response = await trendingRepo.getTrendingMovies("day", _page);
    if(response.apiState == ApiState.success){
      MovieModel movieModel = MovieModel.fromJson(response.data);
      _totalPage = movieModel.totalPages;
      emit(TrendingSuccess(movies: movieModel.movies, pageState: PageState.loaded, pageCount: _page)); 
    }
    else{
      emit(TrendingError(errorState: response.errorState ?? ErrorState.unknown, message: response.data.toString()));
    }
  }

  Future<void> getMoreTrendingMovies(GetTrendingMoviesEvent event, emit)async{
    _page++;
    if(_page<= _totalPage){
      final response = await trendingRepo.getTrendingMovies("day", _page);
      if(response.apiState == ApiState.success){
        MovieModel movieModel = MovieModel.fromJson(response.data);
        emit(TrendingSuccess(movies: state.movies?..addAll(movieModel.movies), pageState: PageState.loadMore, pageCount: _page)); 
      }
      else{
        emit(TrendingError(errorState: response.errorState ?? ErrorState.unknown, message: response.data.toString()));
      }
    }
    else{
      emit(TrendingSuccess(movies: state.movies, pageState: PageState.noMore, pageCount: _page)); 
    }
  }
}
