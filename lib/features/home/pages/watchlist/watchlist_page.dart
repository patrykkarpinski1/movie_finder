import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/home/pages/watchlist/cubit/watchlist_cubit.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WatchlistCubit>(
      create: (context) => getIt<WatchlistCubit>()..getWatchlistMovies(),
      child: BlocConsumer<WatchlistCubit, WatchlistState>(
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
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state.status == Status.success && state.movies != null) {
            final movieModel = state.movies!;
            return Material(
              child: ListView.builder(
                itemCount: movieModel.results!.length,
                itemBuilder: (context, index) {
                  final movie = movieModel.results![index];
                  return ListTile(title: Text(movie.title ?? 'Unknown title'));
                },
              ),
            );
          } else {
            return const Scaffold(
                body: Center(
                    child: Text(
              'No watchlist titles',
              style: TextStyle(fontSize: 24),
            )));
          }
        },
      ),
    );
  }
}
