import 'package:flutter/material.dart';
import 'package:movie_finder/models/details/details_series_model.dart';

class SeasonWidget extends StatelessWidget {
  const SeasonWidget({required this.season, super.key});

  final List<Seasons>? season;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...season?.map((season) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  color: const Color.fromARGB(239, 225, 224, 224),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 115,
                        child: season.posterPath != null
                            ? FadeInImage(
                                placeholder:
                                    const AssetImage('images/load.png'),
                                image: NetworkImage(
                                    'https://www.themoviedb.org/t/p/w500${season.posterPath}'),
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage('images/film.png'),
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              season.name ?? 'download error',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_sharp,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        season.voteAverage.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        season.episodeCount.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        ' episodes',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              season.overview ?? 'download error',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 30,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList() ??
            [],
      ],
    );
  }
}
