import 'package:flutter/cupertino.dart';
import 'package:my_posts_clean_arch/core/utils/styles.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key, required this.error});

  final String error ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error , style: Styles.textDesc,),
    );
  }
}
