import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/language/language.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../l10n/repository/language_repo.dart';

class DrawerBodyItem extends ConsumerWidget {
  const DrawerBodyItem({
    super.key,
    required this.title,
  });

  final Language title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(languageRepoProvider).setLanguage(title);
      },
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: Attributes().longPadding),
        title: Text(
          title.name,
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}
