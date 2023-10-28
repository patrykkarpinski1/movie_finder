import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/pages/rating/cubit/rating_cubit.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../mock_models/mock_movie_model.dart';
import '../../../../../mock_models/mock_tv_series_model.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late RatingCubit sut;
  late MockAccountRepository accountRepository;

  final expectedMovie = MockMovieModel();
  final expectedSeries = MockTvSeriesModel();

  setUp(() {
    SharedPreferences.setMockInitialValues(
        {'sessionId': 'session_id', 'accountId': 1});
    accountRepository = MockAccountRepository();
    sut = RatingCubit(accountRepository);
  });

  group('addRatingMovie', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.addRatingMovie(1, 'session_id', 3.0))
            .thenAnswer((_) async => expectedMovie);
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected stateswhen adding a rating to movie',
        build: () => sut,
        act: (cubit) async => await cubit.addRatingMovie(1, 3.0),
        expect: () => [
          const RatingState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              ratingStatus: {1: true},
              hasChanged: true,
              series: null),
          const RatingState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              ratingStatus: {1: true},
              hasChanged: false,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.addRatingMovie(1, 'session_id', 3.0))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected states when adding a rating to movie fails',
        build: () => sut,
        act: (cubit) async => await cubit.addRatingMovie(1, 3.0),
        expect: () => [
          const RatingState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('getRatingMovie', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.getRatingMovie(
              1,
              'session_id',
            )).thenAnswer((_) async => expectedMovie);
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected states then Status.success with results',
        build: () => sut,
        act: (cubit) async => await cubit.getRatingMovie(),
        expect: () => [
          const RatingState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
          RatingState(
              status: Status.success,
              errorMessage: null,
              movies: expectedMovie,
              ratingStatus: {1: true},
              hasChanged: null,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.getRatingMovie(
              1,
              'session_id',
            )).thenThrow(Exception('test-exception-error'));
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected states when getting rating movie fails',
        build: () => sut,
        act: (cubit) async => await cubit.getRatingMovie(),
        expect: () => [
          const RatingState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
          const RatingState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('addRatingSeries', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.addRatingSeries(1, 'session_id', 3.0))
            .thenAnswer((_) async => expectedSeries);
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected stateswhen adding a rating to series',
        build: () => sut,
        act: (cubit) async => await cubit.addRatingSeries(1, 3.0),
        expect: () => [
          const RatingState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              ratingStatus: {1: true},
              hasChanged: true,
              series: null),
          const RatingState(
              status: Status.initial,
              errorMessage: null,
              movies: null,
              ratingStatus: {1: true},
              hasChanged: false,
              series: null),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.addRatingSeries(1, 'session_id', 3.0))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected stateswhen adding a rating to series fails',
        build: () => sut,
        act: (cubit) async => await cubit.addRatingSeries(1, 3.0),
        expect: () => [
          const RatingState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
  group('getRatingSeries', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.getRatingSeries(
              1,
              'session_id',
            )).thenAnswer((_) async => expectedSeries);
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected states then Status.success with results',
        build: () => sut,
        act: (cubit) async => await cubit.getRatingSeries(),
        expect: () => [
          const RatingState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
          RatingState(
              status: Status.success,
              errorMessage: null,
              movies: null,
              ratingStatus: {1: true},
              hasChanged: null,
              series: expectedSeries),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.getRatingSeries(
              1,
              'session_id',
            )).thenThrow(Exception('test-exception-error'));
      });

      blocTest<RatingCubit, RatingState>(
        'emits expected states when getting rating series fails',
        build: () => sut,
        act: (cubit) async => await cubit.getRatingSeries(),
        expect: () => [
          const RatingState(
              status: Status.loading,
              errorMessage: null,
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
          const RatingState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              movies: null,
              ratingStatus: null,
              hasChanged: null,
              series: null),
        ],
      );
    });
  });
}
