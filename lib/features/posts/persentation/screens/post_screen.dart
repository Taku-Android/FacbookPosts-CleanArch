import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/widgets/post_list_view.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const PostListView()
    );
  }
}






