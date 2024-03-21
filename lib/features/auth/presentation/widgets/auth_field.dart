import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final bool isObscureText;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.textController,
      required this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
    );
  }
}
