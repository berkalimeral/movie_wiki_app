import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Attributes().cardBorderRadius),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_outlined),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ],
            backgroundColor: Colors.red,
            expandedHeight: context.height * 0.35,
            floating: true,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(),
          ),
        ],
      ),
    );
  }
}
