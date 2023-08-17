import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/core/utils/service_locator.dart';
import 'package:my_posts_clean_arch/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const PostApp());
}


