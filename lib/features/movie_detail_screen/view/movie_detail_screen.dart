import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../products/models/movie_detail_model/movie_detail_model.dart';
import '../../../products/providers/movie_detail_service_provider/movie_detail_provider.dart';
import '../widgets/detail_appbar_area.dart';
import '../widgets/detail_body_area.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key, required this.movieId});

  final int? movieId;

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieDetailModel?>(
          future: ref
              .read(movieDetailProvider.notifier)
              .getMovieDetail(widget.movieId!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              MovieDetailModel? movieDetail = snapshot.data;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  DetailAppBarArea(movieDetail: movieDetail),
                  DetailBodyArea(movieDetail: movieDetail),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
