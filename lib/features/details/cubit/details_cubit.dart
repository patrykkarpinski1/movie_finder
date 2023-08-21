import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/details/details_film_model.dart';
import 'package:movie_finder/models/details/details_series_model.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

part 'details_state.dart';
part 'details_cubit.freezed.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.movieRepository) : super(const DetailsState());
  final MovieRepository movieRepository;
  Future<void> getDetailsFilm(int id) async {
    emit(const DetailsState(status: Status.loading));
    try {
      final detailsFilm = await movieRepository.getDetailsFilm(movieId: id);
      emit(
        state.copyWith(
          status: Status.success,
          film: detailsFilm,
        ),
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

  Future<void> getDetailsSeries(int id) async {
    emit(const DetailsState(status: Status.loading));
    try {
      final detailsSeries =
          await movieRepository.getDetailsSeries(seriesId: id);
      emit(
        state.copyWith(
          status: Status.success,
          series: detailsSeries,
        ),
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
