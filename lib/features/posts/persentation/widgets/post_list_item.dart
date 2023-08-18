import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),

          width: MediaQuery.of(context).size.width / .5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(

                children: [
                  Text(
                    '1',
                    style: Styles.textId,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 9,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The First Title ',
                      style: Styles.textTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        'The First Description  The First DescriptionThe First DescriptionThe First DescriptionThe First DescriptionThe First DescriptionThe First DescriptionThe First DescriptionThe First DescriptionThe First Description',
                        style: Styles.textDesc,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0 ),
          child: Divider(
            height: 2,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}