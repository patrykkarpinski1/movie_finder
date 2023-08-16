import 'package:movie_finder/data/movie_data_source.dart';
import 'package:movie_finder/models/popular_movie_model.dart';
import 'package:movie_finder/models/search_model.dart';
import 'package:movie_finder/models/top_rated_movie_model.dart';
import 'package:movie_finder/models/tv_series_model.dart';

class MovieRepository {
  MovieRepository(this.movieDataSource);
  final MovieRemoteRetrofitDataSource movieDataSource;
  Future<PopularMovieModel?> getPopularMovie() async {
    return movieDataSource.getPopularMovie();
  }

  Future<TopRatedMovieModel?> getTopRatedMovie() async {
    return movieDataSource.getTopRatedMovie();
  }

  Future<TvSeriesModel?> getTopRatedTvSeries() async {
    return movieDataSource.getTopRatedTvSeries();
  }

  Future<TvSeriesModel?> getPopularTvSeries() async {
    return movieDataSource.getPopularTvSeries();
  }

  Future<SearchModel?> searchTvSeries({required String query}) async {
    return movieDataSource.searchTvSeries(query);
  }

  Future<SearchModel?> searchMovie({required String query}) async {
    return movieDataSource.searchMovie(query);
  }
}
