import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/core/utils/service_locator.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/add_update_post/add_update_post_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/update_post/update_post_cubit.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/widgets/add_update_post_body.dart';

import '../../domain/entity/post.dart';

class AddUpdatePostScreen extends StatelessWidget {
  const AddUpdatePostScreen({super.key, this.post});

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((post != null) ? 'Update Post' : 'Add post'),
      ),
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => AddUpdatePostCubit(
            getIt(),
            getIt()
          ),
        ),
        BlocProvider(
          create: (_) => UpdatePostCubit(
            getIt(),
          ),
        ),
      ], child: const AddUpdatePostBody()),
    );
  }
}
