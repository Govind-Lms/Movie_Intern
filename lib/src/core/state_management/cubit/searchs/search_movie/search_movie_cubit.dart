import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/models/models.dart';
import 'package:movie_intern/src/core/repositories/search_repo.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit() : super(const SearchIsInitial('Initial'));
  SearchRepository repository = SearchRepository();

  Future<void> fetchSearchedMovies(String query)async{
    try{
      emit(const SearchIsLoading('Loading'));
      final respObj = await repository.getSearchMovieLists(query);
      final results = MovieModel.fromJson(respObj.data);
      if(!isClosed){
        emit( SearchIsSuccess(results));
      }
    }
    catch(e){

      emit(const SearchIsError('Error occur in fetch movie cubit'));
    }
  }

}
