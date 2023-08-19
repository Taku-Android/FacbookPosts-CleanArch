import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/update_post/update_post_state.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit(this.updatePostUseCase) : super(UpdatePostInitial());

  final UpdatePostUseCase updatePostUseCase;

  updatePost(Post post ) async {
    emit(UpdatePostLoading());
    var response = await updatePostUseCase(post);

    response.fold(
      (failure) => emit(UpdatePostFailure(errMessage: failure.errMessage)),
      (success) => emit(
        UpdatePostSuccess(),
      ),
    );
  }
}
