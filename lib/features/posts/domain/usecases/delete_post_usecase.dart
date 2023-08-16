import 'package:dartz/dartz.dart';
import 'package:my_posts_clean_arch/core/errors/failure.dart';
import 'package:my_posts_clean_arch/features/posts/domain/repository/post_repository.dart';

class DeletePostUseCase{
  final PostRepo postRepo ;

  DeletePostUseCase(this.postRepo);


  Future<Either<Failure , Unit>> call(int id ) async {
      return await postRepo.deletePost(id) ;
  }

}