import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/widgets/post_list_item.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context , index){
          return const PostListItem();
        });
  }
}