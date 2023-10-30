import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/repositories/movie_repositories.dart';
import 'package:movie_finder/widgets/search_widget/cubit/search_cubit.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late SearchCubit sut;
  late MockMovieRepository movieRepository;

  setUp(() {
    movieRepository = MockMovieRepository();
    sut = SearchCubit(movieRepository);
  });
  group('search', () {
    group('success', () {
      final mockResultsMovies = [Results(id: 1, type: MediaType.movie)];
      final mockSearchModelMovies = SearchModel(
          page: 3, results: mockResultsMovies, totalPages: 3, totalResults: 3);
      final mockResultsTv = [Results(id: 1, type: MediaType.series)];
      final mockSearchModelTv = SearchModel(
          page: 3, results: mockResultsTv, totalPages: 3, totalResults: 3);

      setUp(() {
        when(() => movieRepository.searchMovie(query: 'query'))
            .thenAnswer((_) async => mockSearchModelMovies);
        when(() => movieRepository.searchTvSeries(query: 'query'))
            .thenAnswer((_) async => mockSearchModelTv);
      });

      blocTest<SearchCubit, SearchState>(
        'emits expected states when search is successful',
        build: () => sut,
        act: (cubit) async => await cubit.search(query: 'query'),
        expect: () => [
          const SearchState(
              status: Status.loading,
              errorMessage: null,
              films: null,
              series: null),
          SearchState(
              status: Status.success,
              errorMessage: null,
              films: mockSearchModelMovies,
              series: mockSearchModelTv),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => movieRepository.searchMovie(query: 'query'))
            .thenThrow(Exception('test-exception-error'));
        when(() => movieRepository.searchTvSeries(query: 'query'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<SearchCubit, SearchState>(
        'emits expected states when a search fails',
        build: () => sut,
        act: (cubit) async => await cubit.search(query: 'query'),
        expect: () => [
          const SearchState(
              status: Status.loading,
              errorMessage: null,
              films: null,
              series: null),
          const SearchState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error',
              films: null,
              series: null),
        ],
      );
    });
  });
}
