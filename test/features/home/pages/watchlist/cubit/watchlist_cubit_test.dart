import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/pages/watchlist/cubit/watchlist_cubit.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../mock_models/mock_movie_model.dart';
import '../../../../../mock_models/mock_tv_series_model.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late WatchlistCubit sut;
  late MockAccountRepository accountRepository;

  final expectedMovie = MockMovieModel();
  final expectedSeries = MockTvSeriesModel();

  setUp(() {
    SharedPreferences.setMockInitialValues(
        {'sessionId': 'session_id', 'accountId': 1});
    accountRepository = MockAccountRepository();
    sut = WatchlistCubit(accountRepository);
  });

  group('addToWatchlistMovie', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.addToWatchlistMovie(
                1, 'session_id', 'media_type', 1, true))
            .thenAnswer((_) async => expectedMovie);
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states when adding to watchlist movie',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addToWatchlistMovie('media_type', 1, true),
        expect: () => [
          const WatchlistState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              watchlistStatus: {1: true},
              hasChanged: true,
              series: null),
          const WatchlistState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              watchlistStatus: {1: true},
              hasChanged: false,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.addToWatchlistMovie(
                1, 'session_id', 'media_type', 1, true))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states when adding to watchlist movie fails',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addToWatchlistMovie('media_type', 1, true),
        expect: () => [
          const WatchlistState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('getWatchlistMovies', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.getWatchlistMovies(
              1,
              'session_id',
            )).thenAnswer((_) async => expectedMovie);
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states then Status.success with results',
        build: () => sut,
        act: (cubit) async => await cubit.getWatchlistMovies(),
        expect: () => [
          const WatchlistState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
          WatchlistState(
              status: Status.success,
              errorMessage: null,
              movies: expectedMovie,
              watchlistStatus: {1: true},
              hasChanged: null,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.getWatchlistMovies(
              1,
              'session_id',
            )).thenThrow(Exception('test-exception-error'));
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states when getting watchlist movie fails',
        build: () => sut,
        act: (cubit) async => await cubit.getWatchlistMovies(),
        expect: () => [
          const WatchlistState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
          const WatchlistState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('addToWatchlistSeries', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.addToWatchlistSeries(
                1, 'session_id', 'media_type', 1, true))
            .thenAnswer((_) async => expectedSeries);
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states when adding to watchlist series',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addToWatchlistSeries('media_type', 1, true),
        expect: () => [
          const WatchlistState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              watchlistStatus: {1: true},
              hasChanged: true,
              series: null),
          const WatchlistState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              watchlistStatus: {1: true},
              hasChanged: false,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.addToWatchlistSeries(
                1, 'session_id', 'media_type', 1, true))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states when adding to watchlist series fails',
        build: () => sut,
        act: (cubit) async =>
            await cubit.addToWatchlistSeries('media_type', 1, true),
        expect: () => [
          const WatchlistState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('getWatchlistSeries', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.getWatchlistSeries(
              1,
              'session_id',
            )).thenAnswer((_) async => expectedSeries);
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states then Status.success with results',
        build: () => sut,
        act: (cubit) async => await cubit.getWatchlistSeries(),
        expect: () => [
          const WatchlistState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
          WatchlistState(
              status: Status.success,
              errorMessage: null,
              movies: null,
              watchlistStatus: {1: true},
              hasChanged: null,
              series: expectedSeries),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.getWatchlistSeries(
              1,
              'session_id',
            )).thenThrow(Exception('test-exception-error'));
      });

      blocTest<WatchlistCubit, WatchlistState>(
        'emits expected states when getting watchlist series fails',
        build: () => sut,
        act: (cubit) async => await cubit.getWatchlistSeries(),
        expect: () => [
          const WatchlistState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
          const WatchlistState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              watchlistStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
}
