import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/src/core/repositories/repository.dart';
import 'package:movie_intern/src/core/models/cast_info_model.dart';

part 'cast_info_state.dart';

class CastInfoCubit extends Cubit<CastInfoState> {
  CastInfoCubit() : super(const PersonIsInitial('initial'));

  CastRepository repo = CastRepository();
  Future<void> fetchCastInfo(int personId) async{
    try{
      emit(const PersonIsLoading("loading"));
      final respObj  = await repo.getCastPersonDetails(personId);
      final resutls = CastInfoModel.fromJson(respObj.data);
      emit(PersonIsSuccess(resutls));
    }
    catch (e){
      emit( PersonIsError(e.toString()));
    }
  }
}
