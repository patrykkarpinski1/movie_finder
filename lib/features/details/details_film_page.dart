import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/details/cubit/details_cubit.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';
import 'package:movie_finder/features/home/pages/rating/cubit/rating_cubit.dart';
import 'package:movie_finder/features/home/pages/watchlist/cubit/watchlist_cubit.dart';
import 'package:movie_finder/models/details/details_film_model.dart';
import 'package:movie_finder/widgets/details/add_favorite_film_widget.dart';
import 'package:movie_finder/widgets/details/add_to_watchlist_film_widget.dart';
import 'package:movie_finder/widgets/details/details_film_widget.dart';
import 'package:movie_finder/widgets/details/rating_widget.dart';

class DetailsFilmPage extends StatefulWidget {
  const DetailsFilmPage({required this.id, this.filmModel, super.key});
  final int id;
  final DetailsFilmModel? filmModel;

  @override
  State<DetailsFilmPage> createState() => _DetailsFilmPageState();
}

class _DetailsFilmPageState extends State<DetailsFilmPage> {
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
          create: (context) => getIt()..getDetailsFilm(widget.id),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => getIt()..getFavoritesMovies(),
        ),
        BlocProvider<WatchlistCubit>(
          create: (context) => getIt()..getWatchlistMovies(),
        ),
        BlocProvider<RatingCubit>(
          create: (context) => getIt(),
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
            if (state.film == null) {
              return const SizedBox.shrink();
            }
          }
          if (state.film != null) {
            final filmModel = state.film!;
            return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_isRatingVisible)
                      RatingWidget(
                        onRatingSubmitted: (rating) {
                          final ratingCubit = context.read<RatingCubit>();
                          ratingCubit.addRatingMovie(widget.id, rating);
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
                          AddFavoriteFilmWidget(
                            filmId: widget.id,
                          ),
                          AddToWatchlistFilmWidget(
                            filmId: widget.id,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.star_border,
                              size: 36,
                              color: Colors.white,
                            ),
                            onPressed: _toggleRatingVisibility,
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
                body: DetailsFilmWidget(filmModel: filmModel));
          } else {
            return Scaffold(
                appBar: AppBar(),
                body: const Center(
                    child: Text(
                  'Film details not available.',
                  style: TextStyle(fontSize: 24),
                )));
          }
        },
      ),
    );
  }
}
