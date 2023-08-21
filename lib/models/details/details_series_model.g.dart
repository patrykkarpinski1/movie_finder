// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailsSeriesModel _$$_DetailsSeriesModelFromJson(
        Map<String, dynamic> json) =>
    _$_DetailsSeriesModel(
      posterPath: json['poster_path'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int,
      overview: json['overview'] as String?,
      voteCount: json['vote_count'] as int?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Seasons.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstAirDate: json['first_air_date'] as String?,
      lastAirDate: json['last_air_date'] as String?,
    );

Map<String, dynamic> _$$_DetailsSeriesModelToJson(
        _$_DetailsSeriesModel instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'name': instance.name,
      'id': instance.id,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'seasons': instance.seasons,
      'first_air_date': instance.firstAirDate,
      'last_air_date': instance.lastAirDate,
    };

_$_Seasons _$$_SeasonsFromJson(Map<String, dynamic> json) => _$_Seasons(
      name: json['name'] as String?,
      episodeCount: json['episode_count'] as int?,
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_SeasonsToJson(_$_Seasons instance) =>
    <String, dynamic>{
      'name': instance.name,
      'episode_count': instance.episodeCount,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
    };
