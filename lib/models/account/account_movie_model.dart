import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_movie_model.freezed.dart';
part 'account_movie_model.g.dart';

@freezed
class AccountMovieModel with _$AccountMovieModel {
  factory AccountMovieModel({
    List<Results>? results,
  }) = _AccountModel;

  factory AccountMovieModel.fromJson(Map<String, dynamic> json) =>
      _$AccountMovieModelFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    String? title,
    required int id,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
