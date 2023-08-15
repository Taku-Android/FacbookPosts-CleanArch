import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/core/app_theme.dart';
import 'package:my_posts_clean_arch/core/utils/app_strings.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppStrings.appName,
      theme: appTheme,
    );
  }
}