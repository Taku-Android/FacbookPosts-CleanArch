import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/core/utils/loading.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/add_update_post/add_update_post_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/add_update_post/add_update_post_state.dart';
import '../../domain/entity/post.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddUpdatePostBody extends StatefulWidget {
  const AddUpdatePostBody({super.key, this.post});

  final Post? post;

  @override
  State<AddUpdatePostBody> createState() => _AddUpdatePostBodyState();
}

class _AddUpdatePostBodyState extends State<AddUpdatePostBody> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUpdatePostCubit, AddUpdatePostState>(
      listener: (context, state) {
        if(state is AddUpdatePostSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Post added successfully'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2), // Duration to display the snackbar
            ),
          );
        }
        if(state is AddUpdatePostFailure){
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2), // Duration to display the snackbar
            ),
          );
        }
      },
      builder: (context, state) {
        if(state is AddUpdatePostLoading){
           return const LoadingWidget();
        }else{return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: titleController,
                  hintText: 'Title',
                  validator: (value) {
                    if (value == null || value
                        .trim()
                        .isEmpty) {
                      return 'Title required';
                    }
                    return null; // Return null if validation passes
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: bodyController,
                  hintText: 'Body',
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value
                        .trim()
                        .isEmpty) {
                      return 'Body required';
                    }
                    return null; // Return null if validation passes
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    onPressed: () {
                      addOrUpdatePost();
                    },
                    addPost: widget.post == null),
              ],
            ),
          ),
        );}

      },
    );
  }

  addOrUpdatePost() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    if (widget.post == null) {
      Post post = Post(title: titleController.text, body: bodyController.text);
      BlocProvider.of<AddUpdatePostCubit>(context).addPost(post);
    } else {
      // Post post = Post(title: titleController.text, body: bodyController.text);
      // BlocProvider.of<AddPostCubit>(context).addPost(post);
    }
  }
}
