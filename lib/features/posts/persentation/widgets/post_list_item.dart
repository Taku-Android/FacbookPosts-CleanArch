import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/features/posts/domain/entity/post.dart';

import '../../../../core/utils/styles.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final Post post ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
          leading: Text('${post.id + 1 }' , style: Styles.textId,),
          title: Text(post.title,style: Styles.textTitle,),
          subtitle:Text(post.body,style: Styles.textDesc,) ,

        ),
        const Divider(height: 2,)
      ],
    );
  }
}