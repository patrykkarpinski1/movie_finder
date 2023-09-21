import 'package:flutter/material.dart';
import 'package:movie_finder/features/details/details_film_page.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/widgets/rating_circle_widget.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.movieModel,
    this.showRating = false,
  });

  final MovieModel movieModel;
  final bool showRating;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: movieModel.results!.length,
          itemBuilder: (context, index) {
            final movie = movieModel.results![index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => DetailsFilmPage(
                            id: movie.id,
                          )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title ?? 'download error',
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
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: movie.backdropPath != null
                                ? FadeInImage(
                                    placeholder:
                                        const AssetImage('images/load.png'),
                                    image: NetworkImage(
                                        'https://www.themoviedb.org/t/p/w500${movie.backdropPath}'),
                                    fit: BoxFit.cover,
                                  )
                                : const Image(
                                    image: AssetImage('images/film.png'),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          if (showRating)
                            Positioned(
                              right: 1.0,
                              bottom: 1.0,
                              child:
                                  RatingCircleWidget(rating: movie.rating ?? 0),
                            ),
                        ],
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
