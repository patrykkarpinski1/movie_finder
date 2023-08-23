// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchModel _$$_SearchModelFromJson(Map<String, dynamic> json) =>
    _$_SearchModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$$_SearchModelToJson(_$_SearchModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      posterPath: json['poster_path'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      id: json['id'] as int,
      type: $enumDecodeNullable(_$MediaTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'name': instance.name,
      'title': instance.title,
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type],
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'movie',
  MediaType.series: 'series',
};
