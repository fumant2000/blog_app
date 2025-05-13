import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isContent;
  const BlogEditor({
    super.key,
    required this.controller,
    required this.hintText,
     this.isContent = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      minLines: isContent ? 3: null,
      maxLines: null,
    );
  }
}
