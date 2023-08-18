import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
          leading: Text('1' , style: Styles.textId,),
          title: Text('First title ',style: Styles.textTitle,),
          subtitle:Text('First description  ',style: Styles.textDesc,) ,

        ),
        const Divider(height: 2,)
      ],
    );
  }
}