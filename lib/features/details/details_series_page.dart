import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/details/cubit/details_cubit.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';
import 'package:movie_finder/models/details/details_series_model.dart';
import 'package:movie_finder/widgets/details/details_series_widget.dart';

class DetailsSeriesPage extends StatelessWidget {
  const DetailsSeriesPage({required this.id, this.seriesModel, super.key});
  final int id;
  final DetailsSeriesModel? seriesModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsCubit>(
          create: (context) => getIt()..getDetailsSeries(id),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => getIt()..getFavoritesSeries(),
        ),
      ],
      child: BlocConsumer<DetailsCubit, DetailsState>(
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
          if (state.status == Status.initial) {
            return const Center(
              child: Text('Initial state'),
            );
          }
          if (state.status == Status.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state.status == Status.success) {
            if (state.series == null) {
              return const SizedBox.shrink();
            }
          }
          if (state.series != null) {
            final seriesModel = state.series!;
            return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: BottomAppBar(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlocConsumer<FavoriteCubit, FavoriteState>(
                        listener: (context, state) {
                          if (state.hasChanged == true) {
                            if (state.favoriteStatus?[id] == true) {
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
                          final isFavorite = state.favoriteStatus?[id] ?? false;
                          return IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 36,
                              color: isFavorite ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              final cubit = context.read<FavoriteCubit>();
                              cubit.addFavoriteMovie("tv", id, !isFavorite);
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.playlist_add,
                          size: 36,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.star_border,
                          size: 36,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                appBar: AppBar(
                  leading: const Image(
                    image: AssetImage('images/video.png'),
                  ),
                  backgroundColor: Colors.black,
                  title: const Center(
                    child: Text('MOVIE FINDER'),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_rounded))
                  ],
                ),
                body: DetailsSeriesWidget(seriesModel: seriesModel));
          } else {
            return Scaffold(
                appBar: AppBar(),
                body: const Center(
                    child: Text(
                  'Series details not available.',
                  style: TextStyle(fontSize: 24),
                )));
          }
        },
      ),
    );
  }
}
