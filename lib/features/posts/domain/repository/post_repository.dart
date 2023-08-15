import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo{

  Future<Either<Failure , List<Post>>> getAllPosts();
  Future<Either<Failure , bool>> updatePost(Post post);
  Future<Either<Failure , bool>> deletePost(int id);
  Future<Either<Failure , bool>> addPost(Post post);

}