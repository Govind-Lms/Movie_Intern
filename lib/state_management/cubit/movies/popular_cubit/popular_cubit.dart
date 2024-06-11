import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/repositories/repository.dart';

import '../../../../models/models.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(IsPopularInitial());

  ApiRepoImplementation repository = ApiRepoImplementation();

  Future<void> getPopularMovies() async {
    try {
      emit(const IsPopularLoading("Loading"));
      final popularMovies = await repository.getModel("popular");
      emit(IsPopularSuccess(popularMovies));
    } catch (e) {
      emit(const IsPopularError("Error Occured in cubit"));
    }
  }
}