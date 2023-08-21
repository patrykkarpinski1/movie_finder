import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_finder/models/details/details_film_model.dart';
import 'package:movie_finder/models/details/details_series_model.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_data_source.g.dart';

@injectable
@RestApi()
abstract class MovieRemoteRetrofitDataSource {
  @factoryMethod
  factory MovieRemoteRetrofitDataSource(Dio dio) =
      _MovieRemoteRetrofitDataSource;

  @GET('movie/popular')
  Future<MovieModel> getPopularMovie();
  @GET('movie/top_rated')
  Future<MovieModel> getTopRatedMovie();
  @GET('tv/top_rated')
  Future<TvSeriesModel> getTopRatedTvSeries();
  @GET('tv/popular')
  Future<TvSeriesModel> getPopularTvSeries();
  @GET('search/tv')
  Future<SearchModel> searchTvSeries(@Query('query') String query);
  @GET('search/movie')
  Future<SearchModel> searchMovie(@Query('query') String query);
  @GET('movie/{movie_id}')
  Future<DetailsFilmModel> getDetailsFilm(@Path('movie_id') int movieId);
  @GET('tv/{series_id}')
  Future<DetailsSeriesModel> getDetailsSeries(@Path('series_id') int seriesId);
}
