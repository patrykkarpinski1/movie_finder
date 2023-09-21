import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/pages/rating/cubit/rating_cubit.dart';
import 'package:movie_finder/widgets/films/movie_widget.dart';
import 'package:movie_finder/widgets/series/series_widget.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  MediaType _selectedWatchlist = MediaType.movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.local_movies),
            onPressed: () {
              context.read<RatingCubit>().getRating(MediaType.movie);
              setState(() {
                _selectedWatchlist = MediaType.movie;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.tv_sharp),
            onPressed: () {
              context.read<RatingCubit>().getRating(MediaType.series);
              setState(() {
                _selectedWatchlist = MediaType.series;
              });
            },
          ),
        ],
      ),
      body: BlocConsumer<RatingCubit, RatingState>(
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
          }
          if (_selectedWatchlist == MediaType.movie) {
            if (state.status == Status.success && state.movies != null) {
              final movieModel = state.movies!;
              return MovieWidget(movieModel: movieModel, showRating: true);
            }
          } else if (_selectedWatchlist == MediaType.series) {
            if (state.status == Status.success && state.series != null) {
              final seriesModel = state.series!;
              return SeriesWidget(seriesModel: seriesModel, showRating: true);
            }
          }
          return const Center(
            child: Text(
              'No favourite titles',
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}
