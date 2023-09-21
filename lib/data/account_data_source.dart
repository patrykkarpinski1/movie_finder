import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_finder/models/account/auth_model.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';
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
  Future<MovieModel> addFavoriteMovie(
      @Path('accountId') int accountId,
      @Query('session_id') String sessionId,
      @Body() Map<String, dynamic> favoriteData);

  @GET('account/{accountId}/favorite/movies')
  Future<MovieModel> getFavoritesMovies(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);

  @POST('account/{accountId}/watchlist')
  Future<MovieModel> addToWatchlistMovie(
      @Path('accountId') int accountId,
      @Query('session_id') String sessionId,
      @Body() Map<String, dynamic> watchlistData);

  @GET('account/{accountId}/watchlist/movies')
  Future<MovieModel> getWatchlistMovies(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);

  @POST('account/{accountId}/favorite')
  Future<TvSeriesModel> addFavoriteSeries(
      @Path('accountId') int accountId,
      @Query('session_id') String sessionId,
      @Body() Map<String, dynamic> favoriteData);

  @GET('account/{accountId}/favorite/tv')
  Future<TvSeriesModel> getFavoritesSeries(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);

  @POST('account/{accountId}/watchlist')
  Future<TvSeriesModel> addToWatchlistSeries(
      @Path('accountId') int accountId,
      @Query('session_id') String sessionId,
      @Body() Map<String, dynamic> watchlistData);

  @GET('account/{accountId}/watchlist/tv')
  Future<TvSeriesModel> getWatchlistSeries(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);

  @POST('movie/{movie_id}/rating')
  Future<MovieModel> addRatingMovie(
      @Path('movie_id') int movieId,
      @Query('session_id') String sessionId,
      @Body() Map<String, double> rating);

  @GET('account/{account_id}/rated/movies')
  Future<MovieModel> getRatingMovie(
      @Path('accountId') int accountId, @Query('session_id') String sessionId);
}
