import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  factory SearchModel({
    required int? page,
    required List<Results>? results,
    required int? totalPages,
    required int? totalResults,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    String? posterPath,
    String? name,
    String? title,
    required int id,
    MediaType? type,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
