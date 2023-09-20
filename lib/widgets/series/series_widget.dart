import 'package:flutter/material.dart';
import 'package:movie_finder/features/details/details_series_page.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';

class SeriesWidget extends StatelessWidget {
  const SeriesWidget({
    super.key,
    required this.seriesModel,
  });

  final TvSeriesModel seriesModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: seriesModel.results!.length,
          itemBuilder: (context, index) {
            final series = seriesModel.results![index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => DetailsSeriesPage(
                            id: series.id,
                          )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        series.name ?? 'download error',
                        maxLines: 3,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              blurRadius: 4.0,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: series.backdropPath != null
                            ? FadeInImage(
                                placeholder:
                                    const AssetImage('images/load.png'),
                                image: NetworkImage(
                                    'https://www.themoviedb.org/t/p/w500${series.backdropPath}'),
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage('images/film.png'),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
