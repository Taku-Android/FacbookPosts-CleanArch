import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/core/utils/loading.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/get_all_posts_bloc/get_all_posts_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/get_all_posts_bloc/get_all_posts_state.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/widgets/post_list_item.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPostsCubit, GetAllPostsState>(
      builder: (context, state) {
        if(state is GetAllPostsFailure){
         return ErrorWidget(state.errMessage);
        }else if(state is GetAllPostsSuccess){
          var posts = state.posts;
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return  PostListItem(post: posts[index]);
              });
        }else{
          return const LoadingWidget();
        }

      },
    );
  }
}