import 'package:freezed_annotation/freezed_annotation.dart';
part 'tv_series_model.freezed.dart';
part 'tv_series_model.g.dart';

@freezed
class TvSeriesModel with _$TvSeriesModel {
  factory TvSeriesModel({
    required List<Results>? results,
  }) = _TvSeriesModel;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesModelFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    String? backdropPath,
    String? name,
    required int id,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
