import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/data/movie_data_source.dart';
import 'package:movie_finder/models/details/details_film_model.dart';
import 'package:movie_finder/models/details/details_series_model.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

import '../mock/mock_movie_model.dart';
import '../mock/mock_tv_series_model.dart';

class MockMovieDataSource extends Mock
    implements MovieRemoteRetrofitDataSource {}

void main() {
  late MovieRepository sut;
  late MockMovieDataSource dataSource;
  setUp(() {
    dataSource = MockMovieDataSource();
    sut = MovieRepository(dataSource);
  });

  group('getMovieModel', () {
    test('should call remoteDataSource.getPopularMovie() method', () async {
      // 1
      when(() => dataSource.getPopularMovie())
          .thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.getPopularMovie();
      // 3
      verify(() => dataSource.getPopularMovie()).called(1);
    });
  });
  group('getMovieModel', () {
    test('should call remoteDataSource.getTopRatedMovie() method', () async {
      // 1
      when(() => dataSource.getTopRatedMovie())
          .thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.getTopRatedMovie();
      // 3
      verify(() => dataSource.getTopRatedMovie()).called(1);
    });
  });
  group('getTvSeriesModel', () {
    test('should call remoteDataSource.getTopRatedTvSeries() method', () async {
      // 1
      when(() => dataSource.getTopRatedTvSeries())
          .thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.getTopRatedTvSeries();
      // 3
      verify(() => dataSource.getTopRatedTvSeries()).called(1);
    });
  });
  group('getTvSeriesModel', () {
    test('should call remoteDataSource.getPopularTvSeries() method', () async {
      // 1
      when(() => dataSource.getPopularTvSeries())
          .thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.getPopularTvSeries();
      // 3
      verify(() => dataSource.getPopularTvSeries()).called(1);
    });
  });

  group('searchTvSeries', () {
    final mockSearchModel =
        SearchModel(page: 1, results: [], totalPages: 1, totalResults: 1);
    test('should call remoteDataSource.searchTvSeries() method', () async {
      // 1
      when(() => dataSource.searchTvSeries('query'))
          .thenAnswer((_) async => mockSearchModel);
      // 2
      await sut.searchTvSeries(query: 'query');
      // 3
      verify(() => dataSource.searchTvSeries('query')).called(1);
    });
  });
  group('searchMovie', () {
    final mockSearchModel =
        SearchModel(page: 1, results: [], totalPages: 1, totalResults: 1);
    test('should call remoteDataSource.searchMovie() method', () async {
      // 1
      when(() => dataSource.searchMovie('query'))
          .thenAnswer((_) async => mockSearchModel);
      // 2
      await sut.searchMovie(query: 'query');
      // 3
      verify(() => dataSource.searchMovie('query')).called(1);
    });
  });
  group('getDetailsFilm', () {
    final mockDetailsFilmModel = DetailsFilmModel(id: 1);
    test('should call remoteDataSource.getDetailsFilm() method', () async {
      // 1
      when(() => dataSource.getDetailsFilm(1))
          .thenAnswer((_) async => mockDetailsFilmModel);
      // 2
      await sut.getDetailsFilm(movieId: 1);
      // 3
      verify(() => dataSource.getDetailsFilm(1)).called(1);
    });
  });
  group('getDetailsSeries', () {
    final mockDetailsSeriesModel = DetailsSeriesModel(id: 1);
    test('should call remoteDataSource.getDetailsSeries() method', () async {
      // 1
      when(() => dataSource.getDetailsSeries(1))
          .thenAnswer((_) async => mockDetailsSeriesModel);
      // 2
      await sut.getDetailsSeries(seriesId: 1);
      // 3
      verify(() => dataSource.getDetailsSeries(1)).called(1);
    });
  });
}
