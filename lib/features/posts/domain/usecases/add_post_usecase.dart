import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';

import '../entity/post.dart';

class AddPostUseCase{
  final PostRepo postRepo ;

  AddPostUseCase(this.postRepo);


  Future<Either<Failure , Unit>> call(Post post) async {
      return await postRepo.addPost(post) ;
  }

}