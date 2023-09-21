// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailsFilmModel _$$_DetailsFilmModelFromJson(Map<String, dynamic> json) =>
    _$_DetailsFilmModel(
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
      id: json['id'] as int,
      overview: json['overview'] as String?,
      voteCount: json['vote_count'] as int?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      runtime: json['runtime'] as int?,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$$_DetailsFilmModelToJson(_$_DetailsFilmModel instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'title': instance.title,
      'id': instance.id,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate,
    };
