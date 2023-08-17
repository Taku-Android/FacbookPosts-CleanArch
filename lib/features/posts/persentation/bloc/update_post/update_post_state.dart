
abstract class UpdatePostState {}

class UpdatePostInitial extends UpdatePostState {}

class UpdatePostLoading extends UpdatePostState {}
class UpdatePostSuccess extends UpdatePostState {
}
class UpdatePostFailure extends UpdatePostState {

  final String errMessage ;

  UpdatePostFailure({required this.errMessage});
}
