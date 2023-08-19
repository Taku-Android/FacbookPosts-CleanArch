import 'package:flutter/material.dart';
import '../../domain/entity/post.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddUpdatePostBody extends StatefulWidget {
  const AddUpdatePostBody({super.key, this.post});
  
  final Post? post ;

  @override
  State<AddUpdatePostBody> createState() => _AddUpdatePostBodyState();
}

class _AddUpdatePostBodyState extends State<AddUpdatePostBody> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(controller: titleController, hintText: 'Title'),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              controller: bodyController,
              hintText: 'Body' ,
              maxLines: 5,
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomButton(addPost: false),
        ],
      ),
    );
  }
}


