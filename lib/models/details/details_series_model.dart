import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_series_model.freezed.dart';
part 'details_series_model.g.dart';

@freezed
class DetailsSeriesModel with _$DetailsSeriesModel {
  factory DetailsSeriesModel({
    String? posterPath,
    String? name,
    required int id,
    String? overview,
    int? voteCount,
    double? voteAverage,
    List<Seasons>? seasons,
    String? firstAirDate,
    String? lastAirDate,
  }) = _DetailsSeriesModel;

  factory DetailsSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsSeriesModelFromJson(json);
}

@freezed
class Seasons with _$Seasons {
  factory Seasons({
    String? name,
    int? episodeCount,
    String? overview,
    double? voteAverage,
    String? posterPath,
  }) = _Seasons;

  factory Seasons.fromJson(Map<String, dynamic> json) =>
      _$SeasonsFromJson(json);
}
