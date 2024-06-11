part of 'cast_info_cubit.dart';

sealed class CastInfoState extends Equatable {
  const CastInfoState();

  @override
  List<Object> get props => [];
}

final class PersonIsInitial extends CastInfoState {
  final String message;
  const PersonIsInitial(this.message);
  @override
  List<Object> get props => [message];
}


final class PersonIsError extends CastInfoState {
  final String message;
  const PersonIsError(this.message);
  @override
  List<Object> get props => [message];
}


final class PersonIsLoading extends CastInfoState {
  final String message;
  const PersonIsLoading(this.message);
  @override
  List<Object> get props => [message];
}

final class PersonIsSuccess extends CastInfoState {
  final CastInfoModel castInfoModel;
  const PersonIsSuccess(this.castInfoModel);
  @override
  List<Object> get props => [castInfoModel];
}
