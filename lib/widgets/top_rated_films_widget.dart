import 'package:flutter/material.dart';
import 'package:movie_finder/models/top_rated_movie_model.dart';

class TopRatedFilmsWidget extends StatelessWidget {
  const TopRatedFilmsWidget({required this.results, super.key});

  final List<Results> results;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'TOP RATED',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              height: 255,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      softWrap: true,
                                      results[index].title,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Image.network(
                                    'https://www.themoviedb.org/t/p/w220_and_h330_face${results[index].backdropPath}',
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            results[index].voteCount.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rate_sharp,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            results[index]
                                                .voteAverage
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 170,
                                    child: Text(
                                      results[index].overview,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 30,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
