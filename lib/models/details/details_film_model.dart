import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_film_model.freezed.dart';
part 'details_film_model.g.dart';

@freezed
class DetailsFilmModel with _$DetailsFilmModel {
  factory DetailsFilmModel({
    String? posterPath,
    String? title,
    required int id,
    String? overview,
    int? voteCount,
    double? voteAverage,
    int? runtime,
    String? releaseDate,
  }) = _DetailsFilmModel;

  factory DetailsFilmModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsFilmModelFromJson(json);
}
