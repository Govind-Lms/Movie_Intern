import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
import 'package:movie_intern/src/core/models/movie_model.dart';
import 'package:movie_intern/src/core/repositories/category_repository.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc() : super(UpcomingInitial()) {
    on<GetUpcomingMovieListEvent>(getUpcomingMovies);
    on<GetMoreUpcomingMovieListEvent>(getMoreUpcomingMovies);
  }
int _totalPage = 0;
  int _page = 0;
  
  final repository = CategoryRepository();
  
  Future<void> getUpcomingMovies(GetUpcomingMovieListEvent event, emit) async{
    _page = 1;
    emit(UpcomingLoading());
    final response = await repository.getRequiredMoviesLists("upcoming", _page);
    
    if(response.apiState == ApiState.success){
      MovieModel movieModel = MovieModel.fromJson(response.data);
      _totalPage = movieModel.totalPages;
      emit(UpcomingSuccess(movies: movieModel.movies,pageCount: _page ,pageState: PageState.loaded));
    }
    else{
      emit(UpcomingError(errorState: response.errorState ?? ErrorState.unknown,message: response.data.toString()));
    }
  }

  Future<void> getMoreUpcomingMovies(GetMoreUpcomingMovieListEvent event, emit) async{
    _page++ ;
    if(_page<_totalPage){
      final response = await repository.getRequiredMoviesLists("upcoming", _page);
      if(response.apiState == ApiState.success){
        MovieModel movieModel = MovieModel.fromJson(response.data);
        emit(UpcomingSuccess(movies: state.movies?..addAll(movieModel.movies),pageCount: _page ,pageState: PageState.loadMore));
      }
      else{
        emit(UpcomingError(errorState: response.errorState ?? ErrorState.unknown,message: response.data.toString()));
      }
    }
    else{
      emit(UpcomingSuccess(movies: state.movies,pageCount: _page,pageState: PageState.noMore));
    }
  }

}