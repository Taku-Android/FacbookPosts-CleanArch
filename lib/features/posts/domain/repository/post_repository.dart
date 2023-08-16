import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo{

  Future<Either<Failure , List<Post>>> getAllPosts();
  Future<Either<Failure , Unit>> updatePost(Post post);
  Future<Either<Failure , Unit>> deletePost(int id);
  Future<Either<Failure , Unit>> addPost(Post post);

}