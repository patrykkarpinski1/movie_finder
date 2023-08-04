import 'package:freezed_annotation/freezed_annotation.dart';
part 'top_rated_movie_model.freezed.dart';
part 'top_rated_movie_model.g.dart';

@freezed
class TopRatedMovieModel with _$TopRatedMovieModel {
  factory TopRatedMovieModel({
    required int page,
    required List<Results> results,
  }) = _TopRatedMovieModel;

  factory TopRatedMovieModel.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMovieModelFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    String? backdropPath,
    String? title,
    double? voteAverage,
    required int id,
    String? overview,
    int? voteCount,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
