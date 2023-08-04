import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_finder/models/popular_movie_model.dart';
import 'package:movie_finder/models/top_rated_movie_model.dart';
import 'package:movie_finder/models/tv_series_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_data_source.g.dart';

@injectable
@RestApi()
abstract class MovieRemoteRetrofitDataSource {
  @factoryMethod
  factory MovieRemoteRetrofitDataSource(Dio dio) =
      _MovieRemoteRetrofitDataSource;

  @GET('movie/popular')
  Future<PopularMovieModel> getPopularMovie();
  @GET('movie/top_rated')
  Future<TopRatedMovieModel> getTopRatedMovie();
  @GET('tv/top_rated')
  Future<TvSeriesModel> getTopRatedTvSeries();
  @GET('tv/popular')
  Future<TvSeriesModel> getPopularTvSeries();
}
