import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/models/movie/movie_model.dart' as movie;

class MockMovieModel extends Mock implements movie.MovieModel {
  @override
  List<movie.Results>? get results => [MockMovieResults()];

  set results(List<movie.Results>? results) {}
}

class MockMovieResults extends Mock implements movie.Results {
  @override
  int get id => 1;
}
