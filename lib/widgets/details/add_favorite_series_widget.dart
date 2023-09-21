import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';

class AddFavoriteSeriesWidget extends StatelessWidget {
  const AddFavoriteSeriesWidget({
    super.key,
    required this.seriesId,
  });

  final int seriesId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state.hasChanged == true) {
          if (state.favoriteStatus?[seriesId] == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added to favourites!'),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed to favourites!'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        final isFavorite = state.favoriteStatus?[seriesId] ?? false;
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 36,
            color: isFavorite ? Colors.red : Colors.white,
          ),
          onPressed: () {
            final cubit = context.read<FavoriteCubit>();
            cubit.addFavoriteMovie("tv", seriesId, !isFavorite);
          },
        );
      },
    );
  }
}
