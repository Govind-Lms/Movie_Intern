import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_intern/repositories/search_repo.dart';
import 'package:movie_intern/models/search_model.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit() : super(const SearchIsInitial('Initial'));
  SearchRepository repository = SearchRepository();

  Future<void> fetchSearchedMovies(String query)async{
    try{
      emit(const SearchIsLoading('Loading'));
      final data = await repository.getSearchMovieLists(query);
      emit( SearchIsSuccess(data));
    }
    catch(e){
      debugPrint(e.toString());
      emit(const SearchIsError('Error occur in fetch movie cubit'));
    }
  }

}
