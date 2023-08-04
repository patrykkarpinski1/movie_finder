import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/popular_movie_model.dart';
import 'package:movie_finder/models/top_rated_movie_model.dart';
import 'package:movie_finder/models/tv_series_model.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.movieRepository) : super(HomeState());
  final MovieRepository movieRepository;
  Future<void> getPopularMovie() async {
    emit(HomeState(status: Status.loading));
    try {
      final popularMovie = await movieRepository.getPopularMovie();
      emit(
        state.copyWith(status: Status.success, popularMovie: popularMovie),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getTopRatedMovie() async {
    emit(HomeState(status: Status.loading));
    try {
      final topRatedMovie = await movieRepository.getTopRatedMovie();
      emit(
        state.copyWith(status: Status.success, topRatedMovie: topRatedMovie),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getTopRatedTvSeries() async {
    emit(HomeState(status: Status.loading));
    try {
      final topRatedTvSeries = await movieRepository.getTopRatedTvSeries();
      emit(
        state.copyWith(
            status: Status.success, topRatedTvSeries: topRatedTvSeries),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getPopularTvSeries() async {
    emit(HomeState(status: Status.loading));
    try {
      final popularTvSeries = await movieRepository.getPopularTvSeries();
      emit(
        state.copyWith(
            status: Status.success, popularTvSeries: popularTvSeries),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
