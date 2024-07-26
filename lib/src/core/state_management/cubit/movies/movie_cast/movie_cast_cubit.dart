import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/repositories/repository.dart';
import '../../../../api_service/resp_obj.dart';

part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(const CastIsInitial("Initial"));

  MoviesInfoRepository repository = MoviesInfoRepository();

  Future<void> fetchCastInfo(int movieId) async {
    try {
      emit(const CastIsLoading('Loading'));
      await Future.delayed(const Duration(microseconds: 100));

      final respObj = await repository.getCastInfo(movieId);
      if (!isClosed) {
        emit(CastIsSuccess(respObj));
      }
    } catch (e) {
      emit(const CastIsError('Error Occur in Cast Cubit'));
    }
  }
}
