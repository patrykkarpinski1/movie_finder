import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rating_state.dart';
part 'rating_cubit.freezed.dart';

class RatingCubit extends Cubit<RatingState> {
  Map<int, bool> ratingStatus = {};
  RatingCubit(this.accountRepository) : super(const RatingState());
  final AccountRepository accountRepository;
  Future<String?> _getSessionIdFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId');
  }

  Future<int?> _getAccountIdFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('accountId');
  }

  Future<void> addRatingMovie(int movieId, double rating) async {
    final sessionId = await _getSessionIdFromPrefs();

    if (sessionId == null) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: "Session is invalid or has expired.",
      ));
      return;
    }

    try {
      await accountRepository.addRatingMovie(movieId, sessionId, rating);
      ratingStatus[movieId] = true;
      emit(state.copyWith(hasChanged: true, ratingStatus: ratingStatus));
      emit(state.copyWith(hasChanged: false));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> getRatingMovie() async {
    emit(const RatingState(status: Status.loading));
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId == null || accountId == null) {
      return;
    }

    try {
      final ratingMovies =
          await accountRepository.getRatingMovie(accountId, sessionId);
      if (ratingMovies != null && ratingMovies.results != null) {
        for (var movie in ratingMovies.results!) {
          ratingStatus[movie.id] = true;
        }
      }
      emit(state.copyWith(
        status: Status.success,
        movies: ratingMovies,
        ratingStatus: ratingStatus,
      ));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> addRatingSeries(int seriesId, double rating) async {
    final sessionId = await _getSessionIdFromPrefs();

    if (sessionId == null) {
      emit(state.copyWith(
        status: Status.error,
        errorMessage: "Session is invalid or has expired.",
      ));
      return;
    }

    try {
      await accountRepository.addRatingSeries(seriesId, sessionId, rating);
      ratingStatus[seriesId] = true;
      emit(state.copyWith(hasChanged: true, ratingStatus: ratingStatus));
      emit(state.copyWith(hasChanged: false));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> getRatingSeries() async {
    emit(const RatingState(status: Status.loading));
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId == null || accountId == null) {
      return;
    }

    try {
      final ratingSeries =
          await accountRepository.getRatingSeries(accountId, sessionId);
      if (ratingSeries != null && ratingSeries.results != null) {
        for (var series in ratingSeries.results!) {
          ratingStatus[series.id] = true;
        }
      }
      emit(state.copyWith(
        status: Status.success,
        series: ratingSeries,
        ratingStatus: ratingStatus,
      ));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }
}
