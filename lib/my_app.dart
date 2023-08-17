import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_posts_clean_arch/core/app_theme.dart';
import 'package:my_posts_clean_arch/core/utils/app_strings.dart';
import 'package:my_posts_clean_arch/core/utils/service_locator.dart';
import 'package:my_posts_clean_arch/features/posts/persentation/bloc/get_all_posts_bloc/get_all_posts_cubit.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<GetAllPostsCubit>()),

      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: appTheme,
      ),
    );
  }
}