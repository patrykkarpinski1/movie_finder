import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_film_model.freezed.dart';
part 'details_film_model.g.dart';

@freezed
class DetailsFilmModel with _$DetailsFilmModel {
  factory DetailsFilmModel({
    String? backdropPath,
    String? originalTitle,
    required int id,
  }) = _DetailsFilmModel;

  factory DetailsFilmModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsFilmModelFromJson(json);
}
