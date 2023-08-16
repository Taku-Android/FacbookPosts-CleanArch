import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';

class UpdatePostUseCase{
  final PostRepo postRepo ;

  UpdatePostUseCase(this.postRepo);


  Future<Either<Failure , Unit>> call(Post post ) async {
      return await postRepo.updatePost(post) ;
  }

}