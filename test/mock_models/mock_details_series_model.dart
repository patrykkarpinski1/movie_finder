import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/models/details/details_series_model.dart'
    as series_details;

class MockDetailsSeriesModel extends Mock
    implements series_details.DetailsSeriesModel {
  @override
  int get id => 1;
}
