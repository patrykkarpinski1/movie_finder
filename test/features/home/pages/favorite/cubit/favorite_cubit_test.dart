import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/pages/favorite/cubit/favorite_cubit.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../mock_models/mock_movie_model.dart';
import '../../../../../mock_models/mock_tv_series_model.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late FavoriteCubit sut;
  late MockAccountRepository accountRepository;

  final expectedMovie = MockMovieModel();
  final expectedSeries = MockTvSeriesModel();

  setUp(() {
    SharedPreferences.setMockInitialValues(
        {'sessionId': 'session_id', 'accountId': 1});
    accountRepository = MockAccountRepository();
    sut = FavoriteCubit(accountRepository);
  });

  group('addFavoriteMovie', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.addFavoriteMovie(
                1, 'session_id', 'media_type', 1, true))
            .thenAnswer((_) async => expectedMovie);
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states when adding favorite movie',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addFavoriteMovie('media_type', 1, true),
        expect: () => [
          const FavoriteState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              favoriteStatus: {1: true},
              hasChanged: true,
              series: null),
          const FavoriteState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              favoriteStatus: {1: true},
              hasChanged: false,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.addFavoriteMovie(
                1, 'session_id', 'media_type', 1, true))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states when adding favorite movie fails',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addFavoriteMovie('media_type', 1, true),
        expect: () => [
          const FavoriteState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('getFavoritesMovies', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.getFavoritesMovies(
              1,
              'session_id',
            )).thenAnswer((_) async => expectedMovie);
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states then Status.success with results',
        build: () => sut,
        act: (cubit) async => await cubit.getFavoritesMovies(),
        expect: () => [
          const FavoriteState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
          FavoriteState(
              status: Status.success,
              errorMessage: null,
              movies: expectedMovie,
              favoriteStatus: {1: true},
              hasChanged: null,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.getFavoritesMovies(
              1,
              'session_id',
            )).thenThrow(Exception('test-exception-error'));
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states when getting favorite movie fails',
        build: () => sut,
        act: (cubit) async => await cubit.getFavoritesMovies(),
        expect: () => [
          const FavoriteState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
          const FavoriteState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('addFavoriteSeries', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.addFavoriteSeries(
                1, 'session_id', 'media_type', 1, true))
            .thenAnswer((_) async => expectedSeries);
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states when adding favorite series',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addFavoriteSeries('media_type', 1, true),
        expect: () => [
          const FavoriteState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              favoriteStatus: {1: true},
              hasChanged: true,
              series: null),
          const FavoriteState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              favoriteStatus: {1: true},
              hasChanged: false,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.addFavoriteSeries(
                1, 'session_id', 'media_type', 1, true))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states when adding favorite series fails',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addFavoriteSeries('media_type', 1, true),
        expect: () => [
          const FavoriteState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('getFavoritesSeries', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.getFavoritesSeries(
              1,
              'session_id',
            )).thenAnswer((_) async => expectedSeries);
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states then Status.success with results',
        build: () => sut,
        act: (cubit) async => await cubit.getFavoritesSeries(),
        expect: () => [
          const FavoriteState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
          FavoriteState(
              status: Status.success,
              errorMessage: null,
              movies: null,
              favoriteStatus: {1: true},
              hasChanged: null,
              series: expectedSeries),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.getFavoritesSeries(
              1,
              'session_id',
            )).thenThrow(Exception('test-exception-error'));
      });

      blocTest<FavoriteCubit, FavoriteState>(
        'emits expected states when getting favorite series fails',
        build: () => sut,
        act: (cubit) async => await cubit.getFavoritesSeries(),
        expect: () => [
          const FavoriteState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
          const FavoriteState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              favoriteStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
}
