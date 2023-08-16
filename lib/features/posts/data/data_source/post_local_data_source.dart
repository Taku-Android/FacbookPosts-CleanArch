import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/features/posts/data/model/post_model.dart';

abstract class PostLocalDataSource{

  Future<List<PostModel>> getAllCashedPosts();
  Future<Unit> savePostsToCash(List<PostModel> postModels);

}

class PostLocalDataSourceImpl extends PostLocalDataSource{
  @override
  Future<List<PostModel>> getAllCashedPosts() {
    // TODO: implement getAllCashedPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> savePostsToCash(List<PostModel> postModels) {
    // TODO: implement savePostsToCash
    throw UnimplementedError();
  }
  
}