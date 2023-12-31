import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.addPost, required this.onPressed});

  final bool addPost;
  final  void Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ,
        child: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (addPost) ? const Icon(Icons.add) : const SizedBox.shrink(),
              const SizedBox(
                width: 10,
              ),
              Center(
                  child: Text(
                (addPost) ? 'Add' : 'Update',
                style: Styles.textTitle
                    .copyWith(color: Colors.white, fontSize: 18),
              ))
            ],
          ),
        ));
  }
}
