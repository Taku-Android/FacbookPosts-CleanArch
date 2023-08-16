import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_posts_clean_arch/features/posts/data/model/post_model.dart';

import '../../../../core/utils/constants.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> updatePost(PostModel postModel);

  Future<Unit> deletePost(int id);
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final Dio _dio;

  PostRemoteDataSourceImpl(this._dio);

  @override
  Future<List<PostModel>> getAllPosts() async {
    _dio.options.headers["content-type"] = "application/json";
    var response = await _dio.get('$kBaseUrl/posts');

    final List decodedJson = json.decode(response.data) as List;
    final List<PostModel> postModels = decodedJson
        .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
        .toList();
    return postModels;
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    _dio.options.headers["content-type"] = "application/json";

    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    await _dio.post('$kBaseUrl/posts', data: body);

    return Future.value(unit);
  }

  @override
  Future<Unit> deletePost(int id) async {
    _dio.options.headers["content-type"] = "application/json";

    await _dio.delete('$kBaseUrl/posts/${id.toString()}');

    return Future.value(unit);
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    await _dio.patch(
        '$kBaseUrl/posts/$postId' , data: body);

    return Future.value(unit);

  }
}
