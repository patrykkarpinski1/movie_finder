// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PopularMovieModel _$$_PopularMovieModelFromJson(Map<String, dynamic> json) =>
    _$_PopularMovieModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PopularMovieModelToJson(
        _$_PopularMovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'id': instance.id,
    };
