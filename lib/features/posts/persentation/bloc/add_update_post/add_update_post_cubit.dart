import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/add_update_post/add_update_post_state.dart';
import '../../../domain/usecases/add_post_usecase.dart';

class AddUpdatePostCubit extends Cubit<AddUpdatePostState> {
  AddUpdatePostCubit(this.addPostUseCase, this.updatePostUseCase) : super(AddUpdatePostInitial());

  final AddPostUseCase addPostUseCase;
  final UpdatePostUseCase updatePostUseCase;

  addPost(Post post) async {
    emit(AddUpdatePostLoading());
    var response = await addPostUseCase(post);

    response.fold(
      (failure) => emit(AddUpdatePostFailure(errMessage: failure.errMessage)),
      (success) => emit(
        AddUpdatePostSuccess(),
      ),
    );
  }

  updatePost(Post post) async {
    emit(AddUpdatePostLoading());
    var response = await updatePostUseCase(post);

    response.fold(
          (failure) => emit(AddUpdatePostFailure(errMessage: failure.errMessage)),
          (success) => emit(
            AddUpdatePostSuccess(),
      ),
    );
  }



}
