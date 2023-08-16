import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/cubit/home_cubit.dart';

class TopRatedFilmsWidget extends StatelessWidget {
  const TopRatedFilmsWidget({Key? key}) : super(key: key);

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
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == Status.initial) {
          context.read<HomeCubit>().getMovieAndSeries();
          return const Center(child: CircularProgressIndicator());
        }
        final results = state.topRatedMovie?.results ?? [];
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
                                          results[index].title ??
                                              'download error',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: results[index].backdropPath !=
                                                null
                                            ? FadeInImage(
                                                width: 130,
                                                placeholder: const AssetImage(
                                                    'images/load.png'),
                                                image: NetworkImage(
                                                    'https://www.themoviedb.org/t/p/w220_and_h330_face${results[index].backdropPath}'),
                                                fit: BoxFit.cover,
                                              )
                                            : const Image(
                                                image: AssetImage(
                                                    'images/film.png'),
                                                width: 130,
                                                fit: BoxFit.cover,
                                              ),
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
                                                results[index]
                                                    .voteCount
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                          results[index].overview ??
                                              'download error',
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 30,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10),
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
      },
    );
  }
}
