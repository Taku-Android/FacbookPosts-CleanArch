import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/add_post/add_post_state.dart';
import '../../../domain/usecases/add_post_usecase.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this.addPostUseCase) : super(AddPostInitial());

  final AddPostUseCase addPostUseCase;

  addPost(Post post ) async {
    emit(AddPostLoading());
    var response = await addPostUseCase(post);

    response.fold(
      (failure) => emit(AddPostFailure(errMessage: failure.errMessage)),
      (success) => emit(
        AddPostSuccess(),
      ),
    );
  }
}
