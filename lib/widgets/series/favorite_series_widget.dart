import 'package:flutter/material.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';

class FavoriteSeriesWidget extends StatelessWidget {
  const FavoriteSeriesWidget({
    super.key,
    required this.seriesModel,
  });

  final TvSeriesModel seriesModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: seriesModel.results!.length,
        itemBuilder: (context, index) {
          final series = seriesModel.results![index];
          return ListTile(title: Text(series.name ?? 'Unknown title'));
        },
      ),
    );
  }
}
