// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TvSeriesModel _$$_TvSeriesModelFromJson(Map<String, dynamic> json) =>
    _$_TvSeriesModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TvSeriesModelToJson(_$_TvSeriesModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      backdropPath: json['backdrop_path'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'name': instance.name,
      'id': instance.id,
    };
