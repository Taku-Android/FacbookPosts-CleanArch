import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/get_all_posts_bloc/get_all_posts_state.dart';

class GetAllPostsCubit extends Cubit<GetAllPostsState> {
  GetAllPostsCubit(this.getAllPostsUseCase) : super(GetAllPostsInitial());

  final GetAllPostsUseCase getAllPostsUseCase;

  getAllPosts() async {
    emit(GetAllPostsLoading());
    var response = await getAllPostsUseCase();

    response.fold(
      (failure) => emit(GetAllPostsFailure(errMessage: failure.errMessage)),
      (success) => emit(
        GetAllPostsSuccess(posts: success),
      ),
    );
  }
}
