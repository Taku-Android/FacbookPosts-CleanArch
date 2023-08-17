import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';

abstract class GetAllPostsState {}

class GetAllPostsInitial extends GetAllPostsState {}

class GetAllPostsLoading extends GetAllPostsState {}
class GetAllPostsSuccess extends GetAllPostsState {

  final List<Post> posts ;

  GetAllPostsSuccess({required this.posts});


}
class GetAllPostsFailure extends GetAllPostsState {

  final String errMessage ;

  GetAllPostsFailure({required this.errMessage});
}
