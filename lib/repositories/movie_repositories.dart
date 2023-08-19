import 'package:movie_finder/data/movie_data_source.dart';
import 'package:movie_finder/models/details/details_film_model.dart';
import 'package:movie_finder/models/movie/movie_model.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/models/series/tv_series_model.dart';

class MovieRepository {
  MovieRepository(this.movieDataSource);
  final MovieRemoteRetrofitDataSource movieDataSource;
  Future<MovieModel?> getPopularMovie() async {
    return movieDataSource.getPopularMovie();
  }

  Future<MovieModel?> getTopRatedMovie() async {
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

  Future<DetailsFilmModel?> getDetailsFilm({required int movieId}) async {
    return movieDataSource.getDetailsFilm(movieId);
  }
}
