import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.movieRepository) : super(HomeState());
  final MovieRepository movieRepository;

  Future<void> getMovieAndSeries() async {
    emit(HomeState(status: Status.loading));
    try {
      final popularMovie = await movieRepository.getPopularMovie();
      final topRatedMovie = await movieRepository.getTopRatedMovie();
      final topRatedTvSeries = await movieRepository.getTopRatedTvSeries();
      final popularTvSeries = await movieRepository.getPopularTvSeries();
      emit(
        state.copyWith(
          status: Status.success,
          popularMovie: popularMovie,
          topRatedMovie: topRatedMovie,
          topRatedTvSeries: topRatedTvSeries,
          popularTvSeries: popularTvSeries,
        ),
      );
    } catch (error) {
      if (!isClosed) {
        emit(
          state.copyWith(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      }
    }
  }
}
