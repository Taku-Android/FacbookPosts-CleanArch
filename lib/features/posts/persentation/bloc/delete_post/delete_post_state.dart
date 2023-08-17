
abstract class DeletePostState {}

class DeletePostInitial extends DeletePostState {}


class DeletePostLoading extends DeletePostState {}
class DeletePostSuccess extends DeletePostState {
}
class DeletePostFailure extends DeletePostState {

  final String errMessage ;

  DeletePostFailure({required this.errMessage});
}
