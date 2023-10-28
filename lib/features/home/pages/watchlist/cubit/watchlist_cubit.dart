import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'watchlist_state.dart';
part 'watchlist_cubit.freezed.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  Map<int, bool> watchlistStatus = {};
  WatchlistCubit(this.accountRepository) : super(const WatchlistState());
  final AccountRepository accountRepository;

  Future<String?> _getSessionIdFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId');
  }

  Future<int?> _getAccountIdFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('accountId');
  }

  Future<void> addToWatchlistMovie(
      String mediaType, int mediaId, bool isWatchlist) async {
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId != null && accountId != null) {
      try {
        await accountRepository.addToWatchlistMovie(
            accountId, sessionId, mediaType, mediaId, isWatchlist);

        watchlistStatus[mediaId] = isWatchlist;
        emit(
            state.copyWith(watchlistStatus: watchlistStatus, hasChanged: true));
        emit(state.copyWith(hasChanged: false));
      } catch (error) {
        emit(state.copyWith(
            status: Status.error, errorMessage: error.toString()));
      }
    }
  }

  Future<void> getWatchlistMovies() async {
    emit(const WatchlistState(status: Status.loading));
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId == null || accountId == null) {
      return;
    }

    try {
      final watchlistMovies =
          await accountRepository.getWatchlistMovies(accountId, sessionId);

      if (watchlistMovies != null && watchlistMovies.results != null) {
        for (var movie in watchlistMovies.results!) {
          watchlistStatus[movie.id] = true;
        }
      }

      emit(state.copyWith(
          status: Status.success,
          movies: watchlistMovies,
          watchlistStatus: watchlistStatus));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> addToWatchlistSeries(
      String mediaType, int mediaId, bool isWatchlist) async {
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId != null && accountId != null) {
      try {
        await accountRepository.addToWatchlistSeries(
            accountId, sessionId, mediaType, mediaId, isWatchlist);

        watchlistStatus[mediaId] = isWatchlist;
        emit(
            state.copyWith(watchlistStatus: watchlistStatus, hasChanged: true));
        emit(state.copyWith(hasChanged: false));
      } catch (error) {
        emit(state.copyWith(
            status: Status.error, errorMessage: error.toString()));
      }
    }
  }

  Future<void> getWatchlistSeries() async {
    emit(const WatchlistState(status: Status.loading));
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId == null || accountId == null) {
      return;
    }

    try {
      final watchlistSeries =
          await accountRepository.getWatchlistSeries(accountId, sessionId);

      if (watchlistSeries != null && watchlistSeries.results != null) {
        for (var series in watchlistSeries.results!) {
          watchlistStatus[series.id] = true;
        }
      }

      emit(state.copyWith(
          status: Status.success,
          series: watchlistSeries,
          watchlistStatus: watchlistStatus));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> getWatchlist(MediaType type) async {
    if (type == MediaType.movie) {
      getWatchlistMovies();
    } else {
      getWatchlistSeries();
    }
  }
}
