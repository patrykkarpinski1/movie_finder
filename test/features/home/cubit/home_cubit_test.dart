import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/home/cubit/home_cubit.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';

import '../../../mock_models/mock_movie_model.dart';
import '../../../mock_models/mock_tv_series_model.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late HomeCubit sut;
  late MockMovieRepository movieRepository;
  setUp(() {
    movieRepository = MockMovieRepository();
    sut = HomeCubit(movieRepository);
  });
  group('getMovieAndSeries', () {
    final expectedMovie = MockMovieModel()..results = [MockMovieResults()];
    final expectedTv = MockTvSeriesModel()..results = [MockTvSeriesResults()];
    group('success', () {
      setUp(() {
        when(() => movieRepository.getPopularMovie())
            .thenAnswer((_) async => expectedMovie);
        when(() => movieRepository.getTopRatedMovie())
            .thenAnswer((_) async => expectedMovie);
        when(() => movieRepository.getTopRatedTvSeries())
            .thenAnswer((_) async => expectedTv);
        when(() => movieRepository.getPopularTvSeries())
            .thenAnswer((_) async => expectedTv);
      });

      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.getMovieAndSeries(),
        expect: () => [
          HomeState(
            status: Status.loading,
            errorMessage: null,
            popularMovie: null,
            topRatedMovie: null,
            topRatedTvSeries: null,
            popularTvSeries: null,
          ),
          HomeState(
            status: Status.success,
            errorMessage: null,
            popularMovie: expectedMovie,
            topRatedMovie: expectedMovie,
            topRatedTvSeries: expectedTv,
            popularTvSeries: expectedTv,
          )
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => movieRepository.getPopularMovie())
            .thenThrow(Exception('test-exception-error'));
        when(() => movieRepository.getTopRatedMovie())
            .thenThrow(Exception('test-exception-error'));
        when(() => movieRepository.getTopRatedTvSeries())
            .thenThrow(Exception('test-exception-error'));
        when(() => movieRepository.getPopularTvSeries())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.getMovieAndSeries(),
        expect: () => [
          HomeState(
            status: Status.loading,
            errorMessage: null,
            popularMovie: null,
            topRatedMovie: null,
            topRatedTvSeries: null,
            popularTvSeries: null,
          ),
          HomeState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
            popularMovie: null,
            topRatedMovie: null,
            topRatedTvSeries: null,
            popularTvSeries: null,
          )
        ],
      );
    });
  });
}
