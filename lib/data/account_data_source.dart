import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_finder/models/account/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'account_data_source.g.dart';

@injectable
@RestApi()
abstract class AccountRemoteRetrofitDataSource {
  @factoryMethod
  factory AccountRemoteRetrofitDataSource(Dio dio) =
      _AccountRemoteRetrofitDataSource;

  @GET('authentication/token/new')
  Future<UserModel> generateRequestToken();

  @POST('authentication/session/new')
  Future<UserModel> createSessionId(
      @Field('request_token') String requestToken);
}
