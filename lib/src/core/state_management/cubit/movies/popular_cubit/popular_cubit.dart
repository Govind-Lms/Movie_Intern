import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
import 'package:movie_intern/src/core/repositories/category_repository.dart';
part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(IsPopularInitial());

  CategoryRepository repository = CategoryRepository();

  Future<void> getPopularMovies() async {
    emit(const IsPopularLoading("Loading"));
    final results = await repository.getRequiredMoviesLists("popular", 1);
    log(results.toString(), name: "Results::::");
    if (results.apiState == ApiState.success) {
      // to parse
      emit(IsPopularSuccess(results));
    } else {
      emit(const IsPopularError('Error Occur in Popular Cubit'));
    }
  }
}
