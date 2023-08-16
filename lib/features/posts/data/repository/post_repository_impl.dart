import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/data/data_source/post_local_data_source.dart';
import 'package:my_posts_clean_arch/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepo{

  final PostRemoteDataSource postRemoteDataSource ;
  final PostLocalDataSource postLocalDataSource ;

  PostRepositoryImpl({required this.postRemoteDataSource, required this.postLocalDataSource});


  @override
  Future<Either<Failure, List<Post>>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }



  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}