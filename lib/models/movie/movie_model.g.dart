// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieModel _$$_MovieModelFromJson(Map<String, dynamic> json) =>
    _$_MovieModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieModelToJson(_$_MovieModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      backdropPath: json['backdrop_path'] as String?,
      title: json['title'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      id: json['id'] as int,
      overview: json['overview'] as String?,
      voteCount: json['vote_count'] as int?,
      posterPath: json['poster_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'id': instance.id,
      'overview': instance.overview,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'rating': instance.rating,
    };
