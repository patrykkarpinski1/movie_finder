import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/cubit/home_cubit.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';

class TvSeriesWidget extends StatefulWidget {
  const TvSeriesWidget({super.key});

  @override
  State<TvSeriesWidget> createState() => _TvSeriesWidgetState();
}

class _TvSeriesWidgetState extends State<TvSeriesWidget> {
  bool _showTopRated = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          final errorMessage = state.errorMessage ?? 'Unknown error';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
        } else if (state.status == Status.initial) {
          context.read<HomeCubit>().getMovieAndSeries();
        }
        final popularResults = state.popularTvSeries?.results ?? [];
        final topRatedResults = state.topRatedTvSeries?.results ?? [];
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
                    itemCount: (_showTopRated && topRatedResults.isNotEmpty)
                        ? topRatedResults.length
                        : (!_showTopRated && popularResults.isNotEmpty)
                            ? popularResults.length
                            : 0,
                    itemBuilder: (context, index, realIndex) {
                      Results? result;

                      if (_showTopRated && index < topRatedResults.length) {
                        result = topRatedResults[index];
                      } else if (!_showTopRated &&
                          index < popularResults.length) {
                        result = popularResults[index];
                      }

                      if (result == null) {
                        return const SizedBox.shrink();
                      }

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
                                  padding: const EdgeInsets.only(
                                      bottom: 15, right: 10),
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
                                              image:
                                                  AssetImage('images/film.png'),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.76,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
