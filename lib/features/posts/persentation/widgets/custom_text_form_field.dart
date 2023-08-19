import 'package:flutter/material.dart';
import 'package:my_posts_clean_arch/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  // Constructor with named parameters
  const CustomTextField({super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textDesc,
        border:  buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder() ,// Customize the border styling here
      ),
    );
  }

}
OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
          color: Colors.black
      )
  );
}