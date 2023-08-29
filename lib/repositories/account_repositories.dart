import 'package:movie_finder/data/account_data_source.dart';
import 'package:movie_finder/models/account/user_model.dart';

class AccountRepository {
  AccountRepository(this.accountDataSource);
  final AccountRemoteRetrofitDataSource accountDataSource;
  Future<UserModel?> generateRequestToken() async {
    return accountDataSource.generateRequestToken();
  }

  Future<UserModel?> createSessionId(String requestToken) async {
    return accountDataSource.createSessionId(requestToken);
  }
}
