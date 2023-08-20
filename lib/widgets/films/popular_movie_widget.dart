import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/details/details_film_page.dart';
import 'package:movie_finder/features/home/cubit/home_cubit.dart';
import 'package:movie_finder/widgets/rating_circle_widget.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({Key? key}) : super(key: key);

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

        final results = state.popularMovie?.results ?? [];
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
                                  padding: const EdgeInsets.only(
                                      bottom: 15, right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => DetailsFilmPage(
                                                    id: results[index].id,
                                                  )));
                                    },
                                    child: ClipRRect(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 140,
                                          maxWidth: 260,
                                        ),
                                        child: results[index].backdropPath !=
                                                null
                                            ? FadeInImage(
                                                placeholder: const AssetImage(
                                                    'images/reload.png'),
                                                image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500${results[index].backdropPath}',
                                                ),
                                              )
                                            : const Image(
                                                image: AssetImage(
                                                    'images/film.png'),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: RatingCircleWidget(
                                      rating:
                                          results[index].voteAverage ?? 0.0),
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
      },
    );
  }
}
