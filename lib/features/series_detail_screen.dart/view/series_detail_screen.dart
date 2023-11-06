import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/providers/series_detail_service_provider/series_detail_provider.dart';

import '../../../products/models/series_detail_model/series_detail_model.dart';
import '../../movie_detail_screen/widgets/detail_appbar_area.dart';
import '../../movie_detail_screen/widgets/detail_body_area.dart';

class SeriesDetailScreen extends ConsumerStatefulWidget {
  const SeriesDetailScreen({super.key, required this.seriesId});

  final int? seriesId;

  @override
  ConsumerState<SeriesDetailScreen> createState() => _SeriesDetailScreenState();
}

class _SeriesDetailScreenState extends ConsumerState<SeriesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SeriesDetailModel?>(
          future: ref
              .read(seriesDetailProvider.notifier)
              .getSeriesDetail(widget.seriesId!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SeriesDetailModel? seriesDetail = snapshot.data;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  DetailAppBarArea(seriesDetail: seriesDetail),
                  DetailBodyArea(seriesDetail: seriesDetail),
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
