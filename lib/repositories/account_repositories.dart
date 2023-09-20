import 'package:movie_finder/data/account_data_source.dart';
import 'package:movie_finder/models/account/account_movie_model.dart';
import 'package:movie_finder/models/account/auth_model.dart';

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

  Future<AccountMovieModel?> addFavorite(int accountId, String sessionId,
      String mediaType, int mediaId, bool isFavorite) async {
    return accountDataSource.addFavorite(accountId, sessionId,
        {"media_type": mediaType, "media_id": mediaId, "favorite": isFavorite});
  }

  Future<AccountMovieModel?> getFavorites(
      int accountId, String sessionId) async {
    return accountDataSource.getFavorites(accountId, sessionId);
  }
}
