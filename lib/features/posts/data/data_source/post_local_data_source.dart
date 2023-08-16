import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/core/errors/exceptions.dart';
import 'package:my_posts_clean_arch/core/utils/constants.dart';
import 'package:my_posts_clean_arch/features/posts/data/model/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource{

  Future<List<PostModel>> getAllCashedPosts();
  Future<Unit> savePostsToCash(List<PostModel> postModels);

}

class PostLocalDataSourceImpl extends PostLocalDataSource{

  final SharedPreferences sharedPreferences ;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PostModel>> getAllCashedPosts() {
      final jsonString = sharedPreferences.getString(kCachedPostsKey);
      if(jsonString != null){
        List decodeJsonData = json.decode(jsonString);
        List<PostModel> jsonToPostModel = decodeJsonData
            .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
            .toList();
        return Future.value(jsonToPostModel) ;
      }else{
        throw EmptyCacheException();
      }
  }

  @override
  Future<Unit> savePostsToCash(List<PostModel> postModels) {
    List postModelToJson = postModels
        .map<Map<String , dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(kCachedPostsKey, json.encode(postModelToJson));
    return Future.value(unit) ;
  }
  
}