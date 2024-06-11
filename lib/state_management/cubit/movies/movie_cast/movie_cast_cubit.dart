import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/repositories/repository.dart';
import 'package:movie_intern/models/movie_cast.dart';

part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(const CastIsInitial("Initial"));

  ApiRepoImplementation repository = ApiRepoImplementation();

  Future<void> fetchCastInfo(int movieId) async{
    try{
      emit(const CastIsLoading('Loading'));
      await Future.delayed(const Duration(microseconds: 100));
      final results = await repository.getCastInfo(movieId);
      emit(CastIsSuccess(results));
    }
    catch (e){
      emit (const CastIsError('Error Occur In Cast Cubit'));
    }
  }
}
