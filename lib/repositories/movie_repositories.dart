import 'package:movie_finder/data/movie_data_source.dart';
import 'package:movie_finder/models/popular_movie_model.dart';
import 'package:movie_finder/models/top_rated_movie_model.dart';

class MovieRepository {
  MovieRepository(this.movieDataSource);
  final MovieRemoteRetrofitDataSource movieDataSource;
  Future<PopularMovieModel?> getPopularMovie() async {
    return movieDataSource.getPopularMovie();
  }

  Future<TopRatedMovieModel?> getTopRatedMovie() async {
    return movieDataSource.getTopRatedMovie();
  }
}
