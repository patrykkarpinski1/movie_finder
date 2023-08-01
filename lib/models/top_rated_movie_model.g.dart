// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopRatedMovieModel _$$_TopRatedMovieModelFromJson(
        Map<String, dynamic> json) =>
    _$_TopRatedMovieModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TopRatedMovieModelToJson(
        _$_TopRatedMovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      backdropPath: json['backdrop_path'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: json['id'] as int,
      overview: json['overview'] as String,
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'id': instance.id,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
    };
