import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/details/cubit/details_cubit.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

import '../../../mock_models/mock_details_film_model.dart';
import '../../../mock_models/mock_details_series_model.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late DetailsCubit sut;
  late MockMovieRepository movieRepository;
  setUp(() {
    movieRepository = MockMovieRepository();
    sut = DetailsCubit(movieRepository);
  });
  group('getDetailsFilm', () {
    final expectedFilm = MockDetailsFilmModel();
    group('success', () {
      setUp(() {
        when(() => movieRepository.getDetailsFilm(movieId: 1))
            .thenAnswer((_) async => expectedFilm);
      });

      blocTest<DetailsCubit, DetailsState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.getDetailsFilm(1),
        expect: () => [
          const DetailsState(
            status: Status.loading,
            errorMessage: null,
            film: null,
          ),
          DetailsState(
            status: Status.success,
            errorMessage: null,
            film: expectedFilm,
          )
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => movieRepository.getDetailsFilm(movieId: 1))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<DetailsCubit, DetailsState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.getDetailsFilm(1),
        expect: () => [
          const DetailsState(
            status: Status.loading,
            errorMessage: null,
            film: null,
          ),
          const DetailsState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
            film: null,
          )
        ],
      );
    });
  });
  group('getDetailsSeries', () {
    final expectedSeries = MockDetailsSeriesModel();
    group('success', () {
      setUp(() {
        when(() => movieRepository.getDetailsSeries(seriesId: 1))
            .thenAnswer((_) async => expectedSeries);
      });

      blocTest<DetailsCubit, DetailsState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.getDetailsSeries(1),
        expect: () => [
          const DetailsState(
            status: Status.loading,
            errorMessage: null,
            series: null,
          ),
          DetailsState(
            status: Status.success,
            errorMessage: null,
            series: expectedSeries,
          )
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => movieRepository.getDetailsSeries(seriesId: 1))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<DetailsCubit, DetailsState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.getDetailsSeries(1),
        expect: () => [
          const DetailsState(
            status: Status.loading,
            errorMessage: null,
            series: null,
          ),
          const DetailsState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
            series: null,
          )
        ],
      );
    });
  });
}
