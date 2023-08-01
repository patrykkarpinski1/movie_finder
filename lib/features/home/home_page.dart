import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/home/cubit/home_cubit.dart';
import 'package:movie_finder/widgets/popular_movie_widget.dart';
import 'package:movie_finder/widgets/top_rated_films_widget.dart';
import 'package:movie_finder/widgets/tv_series_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
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
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.status == Status.initial) {
            context.read<HomeCubit>().getPopularMovie();
            context.read<HomeCubit>().getTopRatedMovie();
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final popularMovieModels = state.popularMovie?.results ?? [];
          final topRatedMovieModel = state.topRatedMovie?.results ?? [];
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                children: const [
                  Image(image: AssetImage('images/video.png')),
                  Text(' MOVIE FINDER'),
                ],
              ),
            ),
            body: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'POPULAR FILMS',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                PopularMovieWidget(results: popularMovieModels),
                TopRatedFilmsWidget(results: topRatedMovieModel),
                TvSeriesWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
