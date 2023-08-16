import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';

class GetAllPostsUseCase{
  final PostRepo postRepo ;

  GetAllPostsUseCase(this.postRepo);


  Future<Either<Failure , List<Post>>> call() async {
      return await postRepo.getAllPosts() ;
  }

}