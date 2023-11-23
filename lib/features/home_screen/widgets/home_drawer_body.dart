import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../assets.dart';
import '../../../core/enums/language/language.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../products/providers/login_provider/login_provider.dart';
import '../../favorite_screen/view/favorite_screen.dart';
import 'home_drawer_body_item.dart';

class AppDrawerBody extends ConsumerWidget {
  const AppDrawerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FavoriteScreen(),
            ));
          },
          title: Text(
            AppLocalizations.of(context)!.favorite,
            style: context.textTheme.titleMedium,
          ),
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context)!.languages,
            style: context.textTheme.titleMedium,
          ),
          children: const [
            DrawerBodyItem(
              title: Language.turkish,
            ),
            DrawerBodyItem(
              title: Language.english,
            ),
          ],
        ),
        ListTile(
          onTap: () {
            showAboutDialog(
              context: context,
              applicationName: 'MovieWiki',
              applicationVersion: '1.0.0',
              useRootNavigator: true,
              children: [
                Text(
                  AppLocalizations.of(context)!.about,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayLarge,
                ),
                const CustomSpace(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.aboutDesc,
                  style: context.textTheme.titleMedium,
                ),
                Image.asset(Assets.images.tmdbLogoPNG),
              ],
            );
          },
          title: Text(
            AppLocalizations.of(context)!.about,
            style: context.textTheme.titleMedium,
          ),
        ),
        ListTile(
          onTap: () async {
            await ref.read(loginProvider.notifier).logoutUser();
          },
          title: Text(
            AppLocalizations.of(context)!.sign_out,
            style: context.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
