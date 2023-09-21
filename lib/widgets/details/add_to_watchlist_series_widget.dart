import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/features/home/pages/watchlist/cubit/watchlist_cubit.dart';

class AddToWatchlistSeriesWidget extends StatelessWidget {
  const AddToWatchlistSeriesWidget({
    super.key,
    required this.seriesId,
  });

  final int seriesId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchlistCubit, WatchlistState>(
      listener: (context, state) {
        if (state.hasChanged == true) {
          if (state.watchlistStatus?[seriesId] == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added to watchlist!'),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed to watchlist!'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        final isWatchlist = state.watchlistStatus?[seriesId] ?? false;
        return IconButton(
          icon: Icon(
            isWatchlist ? Icons.playlist_add_check : Icons.playlist_add,
            size: 36,
            color: isWatchlist ? Colors.yellow : Colors.white,
          ),
          onPressed: () {
            final cubit = context.read<WatchlistCubit>();
            cubit.addToWatchlistSeries("tv", seriesId, !isWatchlist);
          },
        );
      },
    );
  }
}
