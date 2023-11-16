import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../products/providers/movie_service_provider/search_provider.dart';
import '../widgets/result_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColorsDark.cardColor,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearch(ref),
              );
            },
            icon: Icon(
              Icons.search_outlined,
              color: CustomColorsDark.onBackground,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.search),
      ),
    );
  }
}

class MovieSearch extends SearchDelegate {
  MovieSearch(this.ref);
  final WidgetRef ref;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isNotEmpty ? query = '' : null;
        },
        icon: const Icon(Icons.clear_outlined),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ResultsCard(
      future: ref.read(searchProvider.notifier).getMovieWithParam(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
