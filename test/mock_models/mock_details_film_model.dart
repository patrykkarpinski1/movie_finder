import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/models/details/details_film_model.dart'
    as film_details;

class MockDetailsFilmModel extends Mock
    implements film_details.DetailsFilmModel {
  @override
  int get id => 1;
}
