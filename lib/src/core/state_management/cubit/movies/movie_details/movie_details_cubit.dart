import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/repositories/repository.dart';
import 'package:movie_intern/src/core/models/models.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(const MovieDetialsInitial(message: 'Initial'));

  MoviesInfoRepository repository = MoviesInfoRepository();

  Future<void> fetchMoviesInfo(int movieId) async{
    
      emit(const MovieIsLoading('Loaidng'));
      await Future.delayed(const Duration(microseconds: 100));
      final respObj = await repository.getMoviesInfo(movieId);
      final results = MovieDetailsModel.fromJson(respObj.data);
      if(!isClosed){
        emit(MovieIsSuccess(results));
      }
  }
}