import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/repositories/category_repository.dart';

import '../../../../repositories/repository.dart';

part 'nowplaying_state.dart';

class NowplayingCubit extends Cubit<NowplayingState> {
  NowplayingCubit() : super(NowplayingInitial());

  ApiRepoImplementation repository = ApiRepoImplementation();
  final nowPlayingRepo = CategoryRepository();


  Future<void> getNowPlaying() async {
      emit(const NowplayingIsLoading("Loading"));
      final results = await nowPlayingRepo.getRequiredMoviesLists("now_playing",1);
      log(results.toString(), name: "Results::::");
      if(results.apiState == ApiState.success){
        // to parse
        emit(NowplayingSuccess(results));
      }else{
        emit(NowplayingError(results.errorState!,'Error Occur in Nowplaying Cubit'));
      }
  }
}