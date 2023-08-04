import 'package:flutter/material.dart';
import 'package:movie_finder/models/popular_movie_model.dart';
import 'package:movie_finder/widgets/rating_circle_widget.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({
    required this.results,
    Key? key,
  }) : super(key: key);
  final List<Results> results;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 265,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260,
                          child: Text(
                            results[index].title ?? 'download error',
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, right: 10),
                              child: ClipRRect(
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxHeight: 140,
                                    maxWidth: 260,
                                  ),
                                  child: results[index].backdropPath != null
                                      ? FadeInImage(
                                          placeholder: const AssetImage(
                                              'images/reload.png'),
                                          image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${results[index].backdropPath}',
                                          ),
                                        )
                                      : const Image(
                                          image: AssetImage('images/film.png'),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: RatingCircleWidget(
                                  rating: results[index].voteAverage ?? 0.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Premiere: '),
                      Text(results[index].releaseDate ?? 'download error')
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
