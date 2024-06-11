
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/models/movie_model.dart';
import 'package:movie_intern/repositories/genre_repository.dart';
part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreInitial()) {
    on<GetGenreMoviesList>(getGenreMoviesList);
    on<GetMoreGenreMoviesList>(getMoreGenreMoviesList);
  }

  int _totalPage = 0;
  int _page = 0;

  String genreId = ''; 


  final genreRepo = GenreRepository();
  
  Future<void> getGenreMoviesList(GetGenreMoviesList event, emit)async{
    _page = 1;
    emit(GenreLoading());
    final response = await genreRepo.getGenreMovieList("discover/movie",_page);

    if(response.apiState == ApiState.success){
      MovieModel movieModel = MovieModel.fromJson(response.data);
      _totalPage = movieModel.totalPages;
      emit(GenreSuccess(movie: movieModel.movies,pageCount: _page, pageState: PageState.loaded));
    }
    else {
      emit(GenreError(response.errorState ?? ErrorState.unknown, response.data.toString()));
    }
  }

  Future<void> getMoreGenreMoviesList(GetMoreGenreMoviesList event, emit)async{

    
    _page++;
    if(_page<= _totalPage){
      final response = await genreRepo.getGenreMovieList("discover/movie",_page);
      if(response.apiState ==ApiState.success){
        MovieModel movieModel = MovieModel.fromJson(response.data);
        emit(GenreSuccess(movie: state.movies?..addAll(movieModel.movies),pageCount: _page,pageState: PageState.loadMore));
      }
      else {
        emit(GenreError(response.errorState ?? ErrorState.unknown, response.data.toString()));
      }
    }else {
      emit(GenreSuccess(movie: state.movies),pageCount: _page,pageState: PageState.noMore);
    }
  }
}
