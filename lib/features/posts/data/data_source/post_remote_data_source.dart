import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/features/posts/data/model/post_model.dart';

abstract class PostRemoteDataSource{


  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost();
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> deletePost(int id);

}

class PostRemoteDataSourceImpl extends PostRemoteDataSource{


  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }


  @override
  Future<Unit> addPost() {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }


  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}