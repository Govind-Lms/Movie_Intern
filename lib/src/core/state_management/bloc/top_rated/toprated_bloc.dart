import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
import 'package:movie_intern/src/core/models/movie_model.dart';
import 'package:movie_intern/src/core/repositories/category_repository.dart';

part 'toprated_event.dart';
part 'toprated_state.dart';

class TopratedBloc extends Bloc<TopratedEvent, TopratedState> {
  TopratedBloc() : super(TopratedInitial()) {
    on<GetTopRatedMovies>(getTopRatedMovies);
    on<GetMoreTopRatedMovies>(getMoreTopRatedMovies);
  }
  int _totalPage = 0;
  int _page = 0;
  
  final repository = CategoryRepository();
  
  Future<void> getTopRatedMovies(GetTopRatedMovies event, emit) async{
    _page = 1;
    emit(TopratedLoading());
    final response = await repository.getRequiredMoviesLists("top_rated", _page);
    
    if(response.apiState == ApiState.success){
      MovieModel movieModel = MovieModel.fromJson(response.data);
      _totalPage = movieModel.totalPages;
      emit(TopratedSuccess(movies: movieModel.movies,pageCount: _page ,pageState: PageState.loaded));
    }
    else{
      emit(TopratedError(errorState: response.errorState ?? ErrorState.unknown,message: response.data.toString()));
    }
  }

  Future<void> getMoreTopRatedMovies(GetMoreTopRatedMovies event, emit) async{
    _page++ ;
    if(_page<_totalPage){
      final response = await repository.getRequiredMoviesLists("top_rated", _page);
      if(response.apiState == ApiState.success){
        MovieModel movieModel = MovieModel.fromJson(response.data);
        emit(TopratedSuccess(movies: state.movies?..addAll(movieModel.movies),pageCount: _page ,pageState: PageState.loadMore));
      }
      else{
        emit(TopratedError(errorState: response.errorState ?? ErrorState.unknown,message: response.data.toString()));
      }
    }
    else{
      emit(TopratedSuccess(movies: state.movies,pageCount: _page,pageState: PageState.noMore));
    }
  }

}
