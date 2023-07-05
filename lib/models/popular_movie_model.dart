import 'package:freezed_annotation/freezed_annotation.dart';
part 'popular_movie_model.freezed.dart';
part 'popular_movie_model.g.dart';

@freezed
class PopularMovieModel with _$PopularMovieModel {
  factory PopularMovieModel({
    required int page,
    required List<Results> results,
  }) = _PopularMovieModel;

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieModelFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    required String backdropPath,
    required String originalTitle,
    required String releaseDate,
    required double voteAverage,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
