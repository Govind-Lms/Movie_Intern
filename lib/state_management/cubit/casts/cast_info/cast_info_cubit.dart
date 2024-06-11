import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_intern/repositories/repository.dart';
import 'package:movie_intern/models/cast_info_model.dart';

part 'cast_info_state.dart';

class CastInfoCubit extends Cubit<CastInfoState> {
  CastInfoCubit() : super(const PersonIsInitial('initial'));

  CastRepository repo = CastRepository();
  Future<void> fetchCastInfo(int personId) async{
    try{
      emit(const PersonIsLoading("loading"));
      final data  = await repo.getCastPersonDetails(personId);
      emit(PersonIsSuccess(data));
    }
    catch (e){
      emit( PersonIsError(e.toString()));
    }
  }
}
