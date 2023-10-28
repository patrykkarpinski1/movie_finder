import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  Map<int, bool> favoriteStatus = {};

  FavoriteCubit(this.accountRepository) : super(const FavoriteState());
  final AccountRepository accountRepository;

  Future<String?> _getSessionIdFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId');
  }

  Future<int?> _getAccountIdFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('accountId');
  }

  Future<void> addFavoriteMovie(
    String mediaType,
    int mediaId,
    bool isFavorite,
  ) async {
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId != null && accountId != null) {
      try {
        await accountRepository.addFavoriteMovie(
            accountId, sessionId, mediaType, mediaId, isFavorite);

        favoriteStatus[mediaId] = isFavorite;
        emit(state.copyWith(favoriteStatus: favoriteStatus, hasChanged: true));
        emit(state.copyWith(hasChanged: false));
      } catch (error) {
        emit(state.copyWith(
            status: Status.error, errorMessage: error.toString()));
      }
    }
  }

  Future<void> getFavoritesMovies() async {
    emit(const FavoriteState(status: Status.loading));
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId == null || accountId == null) {
      return;
    }

    try {
      final favoritesMovies =
          await accountRepository.getFavoritesMovies(accountId, sessionId);

      if (favoritesMovies != null && favoritesMovies.results != null) {
        for (var movie in favoritesMovies.results!) {
          favoriteStatus[movie.id] = true;
        }
      }

      emit(state.copyWith(
          status: Status.success,
          movies: favoritesMovies,
          favoriteStatus: favoriteStatus));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> addFavoriteSeries(
    String mediaType,
    int mediaId,
    bool isFavorite,
  ) async {
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId != null && accountId != null) {
      await accountRepository.addFavoriteSeries(
          accountId, sessionId, mediaType, mediaId, isFavorite);

      favoriteStatus[mediaId] = isFavorite;
      emit(state.copyWith(favoriteStatus: favoriteStatus, hasChanged: true));
      emit(state.copyWith(hasChanged: false));
    }
  }

  Future<void> getFavoritesSeries() async {
    emit(const FavoriteState(status: Status.loading));
    final sessionId = await _getSessionIdFromPrefs();
    final accountId = await _getAccountIdFromPrefs();

    if (sessionId == null || accountId == null) {
      return;
    }

    try {
      final favoritesSeries =
          await accountRepository.getFavoritesSeries(accountId, sessionId);

      if (favoritesSeries != null && favoritesSeries.results != null) {
        for (var movie in favoritesSeries.results!) {
          favoriteStatus[movie.id] = true;
        }
      }

      emit(state.copyWith(
          status: Status.success,
          series: favoritesSeries,
          favoriteStatus: favoriteStatus));
    } catch (error) {
      emit(
          state.copyWith(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> getFavorites(MediaType type) async {
    if (type == MediaType.movie) {
      getFavoritesMovies();
    } else {
      getFavoritesSeries();
    }
  }
}
