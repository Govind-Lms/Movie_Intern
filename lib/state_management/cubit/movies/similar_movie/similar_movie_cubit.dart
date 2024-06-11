import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/repositories/repository.dart';
import 'package:movie_intern/models/similar_model.dart';

part 'similar_movie_state.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(const SimilarIsInitial('Initial'));

  ApiRepoImplementation repository= ApiRepoImplementation();

  Future<void> fetchSimilarMovies(int movieId) async{
    try{
      emit(const SimilarIsLoading('Loading'));
      final data = await repository.getSimilarMovies(movieId);
      emit( SimilarIsSuccess(data));
    }
    catch (e){
      emit(const SimilarIsError('Error in Similar Cubit'));
    }
  }
}
