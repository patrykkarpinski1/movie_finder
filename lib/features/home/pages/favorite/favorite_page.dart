import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>(
      create: (context) => getIt<FavoriteCubit>()..getFavorites(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
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
            final accountMovieModel = state.movies!;
            return Material(
              child: ListView.builder(
                itemCount: accountMovieModel.results!.length,
                itemBuilder: (context, index) {
                  final movie = accountMovieModel.results![index];
                  return ListTile(title: Text(movie.title ?? 'Unknown title'));
                },
              ),
            );
          } else {
            return const Scaffold(
                body: Center(
                    child: Text(
              'No favourite titles',
              style: TextStyle(fontSize: 24),
            )));
          }
        },
      ),
    );
  }
}
