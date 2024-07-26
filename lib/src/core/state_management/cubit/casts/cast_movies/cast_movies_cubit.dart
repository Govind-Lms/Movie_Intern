import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/repositories/repository.dart';
import 'package:movie_intern/src/core/models/cast_movie_model.dart';

part 'cast_movies_state.dart';

class CastMoviesCubit extends Cubit<CastMoviesState> {
  CastMoviesCubit() : super(const PersonMovieIsInitial('initial'));

  CastRepository repo = CastRepository();
  Future<void> fetchCastMovieInfo(int personId) async{
    try{
      emit(const PersonMovieIsLoading("loading"));
      final respObj  = await repo.getCastPersonMovies(personId);
      final results = CastMovieModel.fromJson(respObj.data);
      emit(PersonMovieIsSuccess(results));
    }
    catch (e){
      emit( PersonMovieIsError(e.toString()));
    }
  }
}
