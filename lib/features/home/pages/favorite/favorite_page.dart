import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';
import 'package:movie_finder/widgets/films/favorite_movie_widget.dart';
import 'package:movie_finder/widgets/series/favorite_series_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteType _selectedFavorite = FavoriteType.movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.movie),
            onPressed: () {
              context.read<FavoriteCubit>().getFavorites(MediaType.movie);
              setState(() {
                _selectedFavorite = FavoriteType.movies;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.tv),
            onPressed: () {
              context.read<FavoriteCubit>().getFavorites(MediaType.series);
              setState(() {
                _selectedFavorite = FavoriteType.series;
              });
            },
          ),
        ],
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
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
          if (_selectedFavorite == FavoriteType.movies) {
            if (state.status == Status.success && state.movies != null) {
              final movieModel = state.movies!;
              return FavoriteMovieWidget(movieModel: movieModel);
            }
          } else if (_selectedFavorite == FavoriteType.series) {
            if (state.status == Status.success && state.series != null) {
              final seriesModel = state.series!;
              return FavoriteSeriesWidget(seriesModel: seriesModel);
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
