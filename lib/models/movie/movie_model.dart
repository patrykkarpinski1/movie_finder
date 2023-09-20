import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    required List<Results>? results,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    String? backdropPath,
    String? title,
    String? releaseDate,
    double? voteAverage,
    required int id,
    String? overview,
    int? voteCount,
    String? posterPath,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
