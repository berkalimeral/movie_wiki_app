import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';

class RatingStarLine extends StatelessWidget {
  const RatingStarLine({
    super.key,
    required this.rating,
  });

  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_outlined,
          size: 20,
          color: CustomColorsDark.ratingIconColor,
        ),
        Text(
          '${rating?.toStringAsFixed(1)}/10 IMDb',
          style: context.textTheme.titleSmall,
        ),
      ],
    );
  }
}
