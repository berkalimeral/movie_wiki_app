import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';
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
        Padding(
          padding: EdgeInsets.symmetric(vertical: Attributes().cardPadding),
          child: Text(
            label,
            style: context.textTheme.titleMedium!.copyWith(
              color: CustomColorsDark.onBackground,
            ),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
