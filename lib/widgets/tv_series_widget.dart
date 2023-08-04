import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_finder/models/tv_series_model.dart';

class TvSeriesWidget extends StatefulWidget {
  const TvSeriesWidget(
      {required this.topRatedResults, required this.popularResults, super.key});
  final List<Results> topRatedResults;
  final List<Results> popularResults;

  @override
  State<TvSeriesWidget> createState() => _TvSeriesWidgetState();
}

class _TvSeriesWidgetState extends State<TvSeriesWidget> {
  bool _showTopRated = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text('TV Series',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showTopRated = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _showTopRated ? Colors.blue.withAlpha(50) : null,
                  ),
                  child: Text(
                    'Top Rated',
                    style: TextStyle(
                      color: _showTopRated ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showTopRated = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _showTopRated ? null : Colors.blue.withAlpha(50),
                  ),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      color: _showTopRated ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black,
              height: 240,
              child: CarouselSlider.builder(
                itemCount: _showTopRated
                    ? widget.topRatedResults.length
                    : widget.popularResults.length,
                itemBuilder: (context, index, realIndex) {
                  final result = _showTopRated
                      ? widget.topRatedResults[index]
                      : widget.popularResults[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.name ?? 'download error',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, right: 10),
                              child: ClipRRect(
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxHeight: 140,
                                    maxWidth: 260,
                                  ),
                                  child: result.backdropPath != null
                                      ? FadeInImage(
                                          placeholder: const AssetImage(
                                              'images/reload.png'),
                                          image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${result.backdropPath}',
                                          ),
                                        )
                                      : const Image(
                                          image: AssetImage('images/film.png'),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 380.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.76,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
