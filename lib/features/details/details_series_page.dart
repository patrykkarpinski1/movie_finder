import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/details/cubit/details_cubit.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';
import 'package:movie_finder/features/home/pages/rating/cubit/rating_cubit.dart';
import 'package:movie_finder/features/home/pages/watchlist/cubit/watchlist_cubit.dart';
import 'package:movie_finder/models/details/details_series_model.dart';
import 'package:movie_finder/widgets/details/add_favorite_series_widget.dart';
import 'package:movie_finder/widgets/details/add_to_watchlist_series_widget.dart';
import 'package:movie_finder/widgets/details/details_series_widget.dart';
import 'package:movie_finder/widgets/details/rating_widget.dart';

class DetailsSeriesPage extends StatefulWidget {
  const DetailsSeriesPage({required this.id, this.seriesModel, super.key});
  final int id;
  final DetailsSeriesModel? seriesModel;

  @override
  State<DetailsSeriesPage> createState() => _DetailsSeriesPageState();
}

class _DetailsSeriesPageState extends State<DetailsSeriesPage> {
  bool _isRatingVisible = false;

  void _toggleRatingVisibility() {
    setState(() {
      _isRatingVisible = !_isRatingVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsCubit>(
          create: (context) => getIt()..getDetailsSeries(widget.id),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => getIt()..getFavoritesSeries(),
        ),
        BlocProvider<WatchlistCubit>(
          create: (context) => getIt()..getWatchlistSeries(),
        ),
        BlocProvider<RatingCubit>(
          create: (context) => getIt()..getRatingSeries(),
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
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isRatingVisible)
                      RatingWidget(
                        onRatingSubmitted: (rating) {
                          final ratingCubit = context.read<RatingCubit>();
                          ratingCubit.addRatingSeries(widget.id, rating);
                          _toggleRatingVisibility();
                        },
                        onRatingCanceled: () {
                          _toggleRatingVisibility();
                        },
                      ),
                    BottomAppBar(
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AddFavoriteSeriesWidget(seriesId: seriesModel.id),
                          AddToWatchlistSeriesWidget(seriesId: seriesModel.id),
                          BlocConsumer<RatingCubit, RatingState>(
                            listener: (context, state) {
                              if (state.status == Status.success &&
                                  state.hasChanged == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Rating added!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else if (state.status == Status.error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        state.errorMessage ?? 'Rating error'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              final hasRating =
                                  state.ratingStatus?[widget.id] ?? false;

                              return IconButton(
                                icon: Icon(
                                  hasRating ? Icons.star : Icons.star_border,
                                  size: 36,
                                  color:
                                      hasRating ? Colors.yellow : Colors.white,
                                ),
                                onPressed: _toggleRatingVisibility,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
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
