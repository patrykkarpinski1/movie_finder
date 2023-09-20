import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';
import 'package:movie_finder/widgets/films/movie_widget.dart';
import 'package:movie_finder/widgets/series/series_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  MediaType _selectedFavorite = MediaType.movie;

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
                _selectedFavorite = MediaType.movie;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.tv),
            onPressed: () {
              context.read<FavoriteCubit>().getFavorites(MediaType.series);
              setState(() {
                _selectedFavorite = MediaType.series;
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
          if (_selectedFavorite == MediaType.movie) {
            if (state.status == Status.success && state.movies != null) {
              final movieModel = state.movies!;
              return MovieWidget(movieModel: movieModel);
            }
          } else if (_selectedFavorite == MediaType.series) {
            if (state.status == Status.success && state.series != null) {
              final seriesModel = state.series!;
              return SeriesWidget(seriesModel: seriesModel);
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
