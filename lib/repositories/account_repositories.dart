import 'package:movie_finder/data/account_data_source.dart';
import 'package:movie_finder/models/account/auth_model.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';

class AccountRepository {
  AccountRepository(this.accountDataSource);
  final AccountRemoteRetrofitDataSource accountDataSource;
  Future<AuthModel?> generateRequestToken() async {
    return accountDataSource.generateRequestToken();
  }

  Future<AuthModel?> createSessionId(String requestToken) async {
    return accountDataSource.createSessionId(requestToken);
  }

  Future<String> loginUser(String username, String password) async {
    AuthModel requestTokenModel =
        await accountDataSource.generateRequestToken();

    AuthModel loginResponse = await accountDataSource.loginUser({
      "username": username,
      "password": password,
      "request_token": requestTokenModel.requestToken!
    });

    if (loginResponse.requestToken != null) {
      AuthModel sessionResponse =
          await accountDataSource.createSessionId(loginResponse.requestToken!);
      if (sessionResponse.sessionId != null) {
        return sessionResponse.sessionId!;
      }
    }
    throw Exception('Failed to obtain session ID.');
  }

  Future<AuthModel?> deleteSession(String sessionId) async {
    return accountDataSource.deleteSession({"session_id": sessionId});
  }

  Future<AuthModel?> getAccountDetails(String sessionId) async {
    return accountDataSource.getAccountDetails(sessionId);
  }

  Future<MovieModel?> addFavoriteMovie(int accountId, String sessionId,
      String mediaType, int mediaId, bool isFavorite) async {
    return accountDataSource.addFavoriteMovie(accountId, sessionId,
        {"media_type": mediaType, "media_id": mediaId, "favorite": isFavorite});
  }

  Future<MovieModel?> getFavoritesMovies(
      int accountId, String sessionId) async {
    return accountDataSource.getFavoritesMovies(accountId, sessionId);
  }

  Future<MovieModel?> addToWatchlistMovie(int accountId, String sessionId,
      String mediaType, int mediaId, bool isWatchlist) async {
    return accountDataSource.addToWatchlistMovie(accountId, sessionId, {
      "media_type": mediaType,
      "media_id": mediaId,
      "watchlist": isWatchlist
    });
  }

  Future<MovieModel?> getWatchlistMovies(
      int accountId, String sessionId) async {
    return accountDataSource.getWatchlistMovies(accountId, sessionId);
  }

  Future<TvSeriesModel?> addFavoriteSeries(int accountId, String sessionId,
      String mediaType, int mediaId, bool isFavorite) async {
    return accountDataSource.addFavoriteSeries(accountId, sessionId,
        {"media_type": mediaType, "media_id": mediaId, "favorite": isFavorite});
  }

  Future<TvSeriesModel?> getFavoritesSeries(
      int accountId, String sessionId) async {
    return accountDataSource.getFavoritesSeries(accountId, sessionId);
  }

  Future<TvSeriesModel?> addToWatchlistSeries(int accountId, String sessionId,
      String mediaType, int mediaId, bool isWatchlist) async {
    return accountDataSource.addToWatchlistSeries(accountId, sessionId, {
      "media_type": mediaType,
      "media_id": mediaId,
      "watchlist": isWatchlist
    });
  }

  Future<TvSeriesModel?> getWatchlistSeries(
      int accountId, String sessionId) async {
    return accountDataSource.getWatchlistSeries(accountId, sessionId);
  }

  Future<MovieModel?> addRatingMovie(
    int movieId,
    String sessionId,
    double rating,
  ) async {
    return accountDataSource
        .addRatingMovie(movieId, sessionId, {"value": rating});
  }

  Future<MovieModel?> getRatingMovie(int accountId, String sessionId) async {
    return accountDataSource.getRatingMovie(accountId, sessionId);
  }
}
