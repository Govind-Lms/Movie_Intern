import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/models/models.dart';
import 'package:movie_intern/src/core/repositories/repository.dart';

part 'similar_movie_state.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(const SimilarIsInitial('Initial'));

  MoviesInfoRepository repository= MoviesInfoRepository();

  Future<void> fetchSimilarMovies(int movieId) async{
    try{
      emit(const SimilarIsLoading('Loading'));
      final respObj = await repository.getSimilarMovies(movieId);
      final results = MovieModel.fromJson(respObj.data);
      if(!isClosed){
        emit( SimilarIsSuccess(results));
      }
    }
    catch (e){
      emit(const SimilarIsError('Error in Similar Cubit'));
    }
  }
}
