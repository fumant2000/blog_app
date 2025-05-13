import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintext;
  final bool isObscureText;
  final TextEditingController controller;
  const AuthField({
    super.key,
    required this.hintext,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintext is missing';
        }
        return null;
      },
      decoration: InputDecoration(hintText: hintext),
      obscureText: isObscureText,
      obscuringCharacter: '*',
    );
  }
}
