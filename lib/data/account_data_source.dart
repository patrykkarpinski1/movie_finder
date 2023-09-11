import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_finder/models/account/auth_model.dart';
import 'package:retrofit/retrofit.dart';

part 'account_data_source.g.dart';

@injectable
@RestApi()
abstract class AccountRemoteRetrofitDataSource {
  @factoryMethod
  factory AccountRemoteRetrofitDataSource(Dio dio) =
      _AccountRemoteRetrofitDataSource;

  @GET('authentication/token/new')
  Future<AuthModel> generateRequestToken();

  @POST('authentication/session/new')
  Future<AuthModel> createSessionId(
      @Field('request_token') String requestToken);
  @POST('authentication/token/validate_with_login')
  Future<AuthModel> loginUser(@Body() Map<String, dynamic> loginData);
  @DELETE('authentication/session')
  Future<AuthModel> deleteSession(@Body() Map<String, dynamic> sessionData);
}