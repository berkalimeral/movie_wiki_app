import 'package:flutter/material.dart';

import '../../../core/utils/attributes/attributes.dart';

class TextInputArea extends StatelessWidget {
  const TextInputArea(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      this.isPassword = false});

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Attributes().cardBorderRadius),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
