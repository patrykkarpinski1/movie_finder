import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

import '../../../app/core/enums.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.movieRepository) : super(const SearchState());
  final MovieRepository movieRepository;

  Future<void> search({required String query}) async {
    emit(const SearchState(status: Status.loading));
    try {
      final searchMovieResults =
          await movieRepository.searchMovie(query: query);
      final searchSeriesResults =
          await movieRepository.searchTvSeries(query: query);

      List<Results>? movieResultsWithType;
      List<Results>? seriesResultsWithType;

      if (searchMovieResults?.results != null) {
        movieResultsWithType = searchMovieResults?.results
            ?.map((result) => result.copyWith(type: MediaType.movie))
            .toList();
      }

      if (searchSeriesResults?.results != null) {
        seriesResultsWithType = searchSeriesResults?.results
            ?.map((result) => result.copyWith(type: MediaType.series))
            .toList();
      }

      emit(
        SearchState(
          status: Status.success,
          films: searchMovieResults?.copyWith(results: movieResultsWithType),
          series: searchSeriesResults?.copyWith(results: seriesResultsWithType),
        ),
      );
    } catch (error) {
      emit(SearchState(status: Status.error, errorMessage: error.toString()));
    }
  }
}
