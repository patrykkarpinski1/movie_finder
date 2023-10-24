import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/data/account_data_source.dart';
import 'package:movie_finder/models/account/auth_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';

import '../mock/mock_movie_model.dart';
import '../mock/mock_tv_series_model.dart';

class MockAccountDataSource extends Mock
    implements AccountRemoteRetrofitDataSource {}

void main() {
  late AccountRepository sut;
  late MockAccountDataSource dataSource;
  setUp(() {
    dataSource = MockAccountDataSource();
    sut = AccountRepository(dataSource);
  });
  group('getAuthModel', () {
    final mockAuthModel = AuthModel();
    test('should call remoteDataSource.generateRequestToken() method',
        () async {
      // 1
      when(() => dataSource.generateRequestToken())
          .thenAnswer((_) async => mockAuthModel);
      // 2
      await sut.generateRequestToken();
      // 3
      verify(() => dataSource.generateRequestToken()).called(1);
    });
  });

  group('createSessionId', () {
    final mockAuthModel = AuthModel();
    test('should call remoteDataSource.createSessionId() method', () async {
      // 1
      when(() => dataSource.createSessionId('request_token'))
          .thenAnswer((_) async => mockAuthModel);
      // 2
      await sut.createSessionId('request_token');
      // 3
      verify(() => dataSource.createSessionId('request_token')).called(1);
    });
  });
  group('loginUser', () {
    test('should successfully log in and return sessionId', () async {
      // 1
      when(() => dataSource.generateRequestToken())
          .thenAnswer((_) async => AuthModel(requestToken: 'request_token'));

      when(() => dataSource.loginUser({
            "username": 'username',
            "password": 'password',
            "request_token": 'request_token'
          })).thenAnswer((_) async => AuthModel(requestToken: 'request_token'));

      when(() => dataSource.createSessionId('request_token'))
          .thenAnswer((_) async => AuthModel(sessionId: 'session_id'));
      // 2
      final sessionId = await sut.loginUser('username', 'password');
      // 3
      expect(sessionId, 'session_id');
      // 4
      verify(() => dataSource.generateRequestToken()).called(1);
      verify(() => dataSource.loginUser({
            "username": 'username',
            "password": 'password',
            "request_token": 'request_token'
          })).called(1);
      verify(() => dataSource.createSessionId('request_token')).called(1);
    });
    test('should handle error when requestToken is null', () async {
      // 1
      when(() => dataSource.generateRequestToken())
          .thenThrow(Exception('error'));
      // 2
      await expectLater(() => sut.loginUser('username', 'password'),
          throwsA(isA<Exception>()));
      // 3
      verify(() => dataSource.generateRequestToken()).called(1);
    });
  });
  group('deleteSession', () {
    final mockAuthModel = AuthModel();
    test('should call remoteDataSource.deleteSession() method', () async {
      // 1
      when(() => dataSource.deleteSession(any()))
          .thenAnswer((_) async => mockAuthModel);
      // 2
      await sut.deleteSession("session_id");
      // 3
      verify(() => dataSource.deleteSession(any())).called(1);
    });
  });
  group('getAccountDetails', () {
    final mockAuthModel = AuthModel();
    test('should call remoteDataSource.getAccountDetails() method', () async {
      // 1
      when(() => dataSource.getAccountDetails('session_id'))
          .thenAnswer((_) async => mockAuthModel);
      // 2
      await sut.getAccountDetails('session_id');
      // 3
      verify(() => dataSource.getAccountDetails('session_id')).called(1);
    });
  });
  group('addFavoriteMovie', () {
    const accountId = 1;
    const sessionId = 'session_id';
    const mediaType = 'mediaType';
    const mediaId = 1;
    const isFavorite = true;
    test('should call remoteDataSource.addFavoriteMovie() method', () async {
      // 1
      when(() => dataSource.addFavoriteMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.addFavoriteMovie(
          accountId, sessionId, mediaType, mediaId, isFavorite);
      // 3
      verify(() => dataSource.addFavoriteMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).called(1);
    });
    test('should handle error from remoteDataSource.addFavoriteMovie() method',
        () async {
      // 1
      when(() => dataSource.addFavoriteMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).thenThrow(Exception('error'));
      // 2
      await expectLater(
          () => sut.addFavoriteMovie(
              accountId, sessionId, mediaType, mediaId, isFavorite),
          throwsA(isA<Exception>()));
      // 3
      verify(() => dataSource.addFavoriteMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).called(1);
    });
  });
  group('getFavoritesMovies', () {
    test('should call remoteDataSource.getFavoritesMovies() method', () async {
      // 1
      when(() => dataSource.getFavoritesMovies(1, 'session_id'))
          .thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.getFavoritesMovies(1, 'session_id');
      // 3
      verify(() => dataSource.getFavoritesMovies(1, 'session_id')).called(1);
    });
  });
  group('addToWatchlistMovie', () {
    const accountId = 1;
    const sessionId = 'session_id';
    const mediaType = 'mediaType';
    const mediaId = 1;
    const isWatchlist = true;
    test('should call remoteDataSource.addToWatchlistMovie() method', () async {
      // 1
      when(() => dataSource.addToWatchlistMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.addToWatchlistMovie(
          accountId, sessionId, mediaType, mediaId, isWatchlist);
      // 3
      verify(() => dataSource.addToWatchlistMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).called(1);
    });
    test(
        'should handle error from remoteDataSource.addToWatchlistMovie() method',
        () async {
      // 1
      when(() => dataSource.addToWatchlistMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).thenThrow(Exception('error'));
      // 2
      await expectLater(
          () => sut.addToWatchlistMovie(
              accountId, sessionId, mediaType, mediaId, isWatchlist),
          throwsA(isA<Exception>()));
      // 3
      verify(() => dataSource.addToWatchlistMovie(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).called(1);
    });
  });
  group('getWatchlistMovies', () {
    test('should call remoteDataSource.getWatchlistMovies() method', () async {
      // 1
      when(() => dataSource.getWatchlistMovies(1, 'session_id'))
          .thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.getWatchlistMovies(1, 'session_id');
      // 3
      verify(() => dataSource.getWatchlistMovies(1, 'session_id')).called(1);
    });
  });
  group('addFavoriteSeries', () {
    const accountId = 1;
    const sessionId = 'session_id';
    const mediaType = 'mediaType';
    const mediaId = 1;
    const isFavorite = true;
    test('should call remoteDataSource.addFavoriteSeries() method', () async {
      // 1
      when(() => dataSource.addFavoriteSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.addFavoriteSeries(
          accountId, sessionId, mediaType, mediaId, isFavorite);
      // 3
      verify(() => dataSource.addFavoriteSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).called(1);
    });
    test('should handle error from remoteDataSource.addFavoriteSeries() method',
        () async {
      // 1
      when(() => dataSource.addFavoriteSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).thenThrow(Exception('error'));
      // 2
      await expectLater(
          () => sut.addFavoriteSeries(
              accountId, sessionId, mediaType, mediaId, isFavorite),
          throwsA(isA<Exception>()));
      // 3
      verify(() => dataSource.addFavoriteSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "favorite": isFavorite
          })).called(1);
    });
  });
  group('getFavoritesSeries', () {
    test('should call remoteDataSource.getFavoritesSeries() method', () async {
      // 1
      when(() => dataSource.getFavoritesSeries(1, 'session_id'))
          .thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.getFavoritesSeries(1, 'session_id');
      // 3
      verify(() => dataSource.getFavoritesSeries(1, 'session_id')).called(1);
    });
  });
  group('addToWatchlistSeries', () {
    const accountId = 1;
    const sessionId = 'session_id';
    const mediaType = 'mediaType';
    const mediaId = 1;
    const isWatchlist = true;
    test('should call remoteDataSource.addToWatchlistSeries() method',
        () async {
      // 1
      when(() => dataSource.addToWatchlistSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.addToWatchlistSeries(
          accountId, sessionId, mediaType, mediaId, isWatchlist);
      // 3
      verify(() => dataSource.addToWatchlistSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).called(1);
    });
    test(
        'should handle error from remoteDataSource.addToWatchlistSeries() method',
        () async {
      // 1
      when(() => dataSource.addToWatchlistSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).thenThrow(Exception('error'));
      // 2
      await expectLater(
          () => sut.addToWatchlistSeries(
              accountId, sessionId, mediaType, mediaId, isWatchlist),
          throwsA(isA<Exception>()));
      // 3
      verify(() => dataSource.addToWatchlistSeries(accountId, sessionId, {
            "media_type": mediaType,
            "media_id": mediaId,
            "watchlist": isWatchlist
          })).called(1);
    });
  });
  group('getWatchlistSeries', () {
    test('should call remoteDataSource.getWatchlistSeries() method', () async {
      // 1
      when(() => dataSource.getWatchlistSeries(1, 'session_id'))
          .thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.getWatchlistSeries(1, 'session_id');
      // 3
      verify(() => dataSource.getWatchlistSeries(1, 'session_id')).called(1);
    });
  });
  group('addRatingMovie', () {
    const movieId = 1;
    const sessionId = 'session_id';
    const rating = 3.0;
    test('should call remoteDataSource.addRatingMovie() method', () async {
      // 1
      when(() =>
              dataSource.addRatingMovie(movieId, sessionId, {"value": rating}))
          .thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.addRatingMovie(movieId, sessionId, rating);
      // 3
      verify(() =>
              dataSource.addRatingMovie(movieId, sessionId, {"value": rating}))
          .called(1);
    });
    test('should handle error remoteDataSource.addRatingMovie() method',
        () async {
      // 1
      when(() =>
              dataSource.addRatingMovie(movieId, sessionId, {"value": rating}))
          .thenThrow(Exception('error'));
      // 2
      await expectLater(() => sut.addRatingMovie(movieId, sessionId, rating),
          throwsA(isA<Exception>()));
      // 3
      verify(() =>
              dataSource.addRatingMovie(movieId, sessionId, {"value": rating}))
          .called(1);
    });
  });
  group('getRatingMovie', () {
    test('should call remoteDataSource.getRatingMovie() method', () async {
      // 1
      when(() => dataSource.getRatingMovie(1, 'session_id'))
          .thenAnswer((_) async => MockMovieModel());
      // 2
      await sut.getRatingMovie(1, 'session_id');
      // 3
      verify(() => dataSource.getRatingMovie(1, 'session_id')).called(1);
    });
  });

  group('addRatingSeries', () {
    const seriesId = 1;
    const sessionId = 'session_id';
    const rating = 3.0;
    test('should call remoteDataSource.addRatingSeries() method', () async {
      // 1
      when(() => dataSource
              .addRatingSeries(seriesId, sessionId, {"value": rating}))
          .thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.addRatingSeries(seriesId, sessionId, rating);
      // 3
      verify(() => dataSource
          .addRatingSeries(seriesId, sessionId, {"value": rating})).called(1);
    });
    test('should handle error remoteDataSource.addRatingSeries() method',
        () async {
      // 1
      when(() => dataSource
              .addRatingSeries(seriesId, sessionId, {"value": rating}))
          .thenThrow(Exception('error'));
      // 2
      await expectLater(() => sut.addRatingSeries(seriesId, sessionId, rating),
          throwsA(isA<Exception>()));
      // 3
      verify(() => dataSource
          .addRatingSeries(seriesId, sessionId, {"value": rating})).called(1);
    });
  });
  group('getRatingSeries', () {
    test('should call remoteDataSource.getRatingSeries() method', () async {
      // 1
      when(() => dataSource.getRatingSeries(1, 'session_id'))
          .thenAnswer((_) async => MockTvSeriesModel());
      // 2
      await sut.getRatingSeries(1, 'session_id');
      // 3
      verify(() => dataSource.getRatingSeries(1, 'session_id')).called(1);
    });
  });
}
