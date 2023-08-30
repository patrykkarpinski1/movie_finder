import 'package:movie_finder/data/account_data_source.dart';
import 'package:movie_finder/models/account/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountRepository {
  AccountRepository(this.accountDataSource);
  final AccountRemoteRetrofitDataSource accountDataSource;
  Future<AuthModel?> generateRequestToken() async {
    return accountDataSource.generateRequestToken();
  }

  Future<AuthModel?> createSessionId(String requestToken) async {
    return accountDataSource.createSessionId(requestToken);
  }

  void openAuthenticationUrl(String requestToken) {
    final url = 'https://www.themoviedb.org/authenticate/$requestToken';
    launchUrl(Uri.parse(url));
  }
}
