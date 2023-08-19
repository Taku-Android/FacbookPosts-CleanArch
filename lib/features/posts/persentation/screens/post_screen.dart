import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/get_all_posts_bloc/get_all_posts_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/screens/add_update_post_screen.dart';
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
             Navigator.push(context, MaterialPageRoute(builder: (_) => const AddUpdatePostScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)
          ),
          child: const Icon(Icons.add , color: Colors.white,),
        ),
      ),
      body: RefreshIndicator(
          onRefresh: ()async{
            onRefreshEvent(context);
          },
          child: const PostListView())
    );
  }

  onRefreshEvent(BuildContext context) async {

    await BlocProvider.of<GetAllPostsCubit>(context).getAllPosts();

  }
}







