import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/models/series/tv_series_model.dart' as tv;

class MockTvSeriesModel extends Mock implements tv.TvSeriesModel {
  @override
  List<tv.Results>? get results => [MockTvSeriesResults()];

  set results(List<tv.Results>? results) {}
}

class MockTvSeriesResults extends Mock implements tv.Results {
  @override
  int get id => 1;
}
