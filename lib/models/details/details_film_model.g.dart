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
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'genres': instance.genres,
    };

_$_Genres _$$_GenresFromJson(Map<String, dynamic> json) => _$_Genres(
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_GenresToJson(_$_Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
