import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/widgets/add_update_post_body.dart';

import '../../domain/entity/post.dart';

class AddUpdatePostScreen extends StatelessWidget {
  const AddUpdatePostScreen({super.key, this.post});

  final Post? post ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((post != null) ? 'Update Post':'Add post'),
      ),
      body: const AddUpdatePostBody(),
    );
  }
}




