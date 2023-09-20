import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_finder/models/account/account_movie_model.dart';
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

  @GET('account')
  Future<AuthModel> getAccountDetails(@Query('session_id') String sessionId);

  @POST('account/{accountId}/favorite')
  Future<AccountMovieModel> addFavoriteMovie(
      @Path('accountId') int accountId,
      @Query('session_id') String sessionId,
      @Body() Map<String, dynamic> favoriteData);

  @GET('account/{accountId}/favorite/movies')
  Future<AccountMovieModel> getFavoritesMovies(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);

  @POST('account/{accountId}/watchlist')
  Future<AccountMovieModel> addToWatchlistMovie(
      @Path('accountId') int accountId,
      @Query('session_id') String sessionId,
      @Body() Map<String, dynamic> watchlistData);

  @GET('account/{accountId}/watchlist/movies')
  Future<AccountMovieModel> getWatchlistMovies(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);
}
