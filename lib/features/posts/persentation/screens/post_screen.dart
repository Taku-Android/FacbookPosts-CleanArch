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
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)
          ),
          child: const Icon(Icons.add , color: Colors.white,),
        ),
      ),
      body: const PostListView()
    );
  }
}






