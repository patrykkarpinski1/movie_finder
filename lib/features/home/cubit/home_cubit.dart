import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/popular_movie_model.dart';
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
}
