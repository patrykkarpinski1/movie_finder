import 'package:flutter/material.dart';
import 'package:movie_finder/models/movie/movie_model.dart';

class FavoriteMovieWidget extends StatelessWidget {
  const FavoriteMovieWidget({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: movieModel.results!.length,
        itemBuilder: (context, index) {
          final movie = movieModel.results![index];
          return ListTile(title: Text(movie.title ?? 'Unknown title'));
        },
      ),
    );
  }
}
