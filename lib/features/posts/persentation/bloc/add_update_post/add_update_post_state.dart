
abstract class AddUpdatePostState {}

class AddUpdatePostInitial extends AddUpdatePostState {}

class AddUpdatePostLoading extends AddUpdatePostState {}
class AddUpdatePostSuccess extends AddUpdatePostState {
}
class AddUpdatePostFailure extends AddUpdatePostState {

  final String errMessage ;

  AddUpdatePostFailure({required this.errMessage});
}
