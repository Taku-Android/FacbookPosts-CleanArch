
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/delete_post/delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostCubit(this.deletePostUseCase) : super(DeletePostInitial());

  final DeletePostUseCase deletePostUseCase ;

  deletePost(int id) async {
    emit(DeletePostLoading());
    var response = await deletePostUseCase(id);

    response.fold(
            (failure) => emit(DeletePostFailure(errMessage: failure.errMessage)),
            (success) => emit(DeletePostSuccess()));
  }

}
