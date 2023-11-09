import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../products/providers/app_provider/app_provider.dart';

class DrawerBodyItem extends ConsumerWidget {
  const DrawerBodyItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(appProvider.notifier).changeLanguage(context);
      },
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: Attributes().longPadding),
        title: Text(
          title,
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}
