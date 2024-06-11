import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/repositories/repository.dart';
import 'package:movie_intern/models/models.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(const MovieDetialsInitial(message: 'Initial'));

  ApiRepoImplementation repository = ApiRepoImplementation();

  Future<void> fetchMoviesInfo(int movieId) async{
    try{
      emit(const MovieIsLoading('Loaidng'));
      await Future.delayed(const Duration(microseconds: 100));
      final results = await repository.getMoviesInfo(movieId);
      emit(MovieIsSuccess(results));
    }
    catch (e){
      emit(const MovieIsError("Error Occur in Cubit"));
    }
  }
}