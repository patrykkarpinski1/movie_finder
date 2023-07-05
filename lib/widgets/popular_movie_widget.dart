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
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      results[index].originalTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, right: 10),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${results[index].backdropPath}',
                            fit: BoxFit.cover,
                            width: 300,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: RatingCircleWidget(
                              rating: results[index].voteAverage),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Premiere: '),
                    Text(results[index].releaseDate)
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
