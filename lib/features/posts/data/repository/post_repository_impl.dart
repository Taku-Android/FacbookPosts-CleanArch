import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_posts_clean_arch/core/errors/exceptions.dart';
import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/data/data_source/post_local_data_source.dart';
import 'package:my_posts_clean_arch/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:my_posts_clean_arch/features/posts/data/model/post_model.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';

import '../../../../core/network/internet_checker.dart';

class PostRepositoryImpl extends PostRepo{

  final PostRemoteDataSource postRemoteDataSource ;
  final PostLocalDataSource postLocalDataSource ;
  final InternetChecker internetChecker ;

  PostRepositoryImpl(this.internetChecker, {required this.postRemoteDataSource, required this.postLocalDataSource});


  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if(await internetChecker.isConnected){
      try{
        final remotePosts = await postRemoteDataSource.getAllPosts();
        postLocalDataSource.savePostsToCash(remotePosts);
        return right(remotePosts);
      }catch(e){
          if(e is DioException){
            return left(ServerError.fromDioError(e));
          }else{
            return left(ServerError(e.toString()));

          }
      }
    }else{
      try{
        final cashedPosts = await postLocalDataSource.getAllCashedPosts();
        return right(cashedPosts);
      }on EmptyCacheException{
        return left(CashError('No Data'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
     final postModel = PostModel(id: post.id ,title: post.title, body: post.body);
    if(await internetChecker.isConnected){
      try{
         await postRemoteDataSource.addPost(postModel);
        return right(unit);
      }catch(e){
        if(e is DioException){
          return left(ServerError.fromDioError(e));
        }else{
          return left(ServerError(e.toString()));

        }
      }
    }else{
      return left(OfflineError('No Internet'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    if(await internetChecker.isConnected){
      try{
        await postRemoteDataSource.deletePost(id);
        return right(unit);
      }catch(e){
        if(e is DioException){
          return left(ServerError.fromDioError(e));
        }else{
          return left(ServerError(e.toString()));

        }
      }
    }else{
      return left(OfflineError('No Internet'));
    }
  }



  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final postModel = PostModel(id: post.id ,title: post.title, body: post.body);
    if(await internetChecker.isConnected){
      try{
        await postRemoteDataSource.updatePost(postModel);
        return right(unit);
      }catch(e){
        if(e is DioException){
          return left(ServerError.fromDioError(e));
        }else{
          return left(ServerError(e.toString()));

        }
      }
    }else{
      return left(OfflineError('No Internet'));
    }
  }

}