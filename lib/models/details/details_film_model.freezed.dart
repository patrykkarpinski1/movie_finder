// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_film_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailsFilmModel _$DetailsFilmModelFromJson(Map<String, dynamic> json) {
  return _DetailsFilmModel.fromJson(json);
}

/// @nodoc
mixin _$DetailsFilmModel {
  String? get posterPath => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  int? get voteCount => throw _privateConstructorUsedError;
  double? get voteAverage => throw _privateConstructorUsedError;
  int? get runtime => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsFilmModelCopyWith<DetailsFilmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsFilmModelCopyWith<$Res> {
  factory $DetailsFilmModelCopyWith(
          DetailsFilmModel value, $Res Function(DetailsFilmModel) then) =
      _$DetailsFilmModelCopyWithImpl<$Res, DetailsFilmModel>;
  @useResult
  $Res call(
      {String? posterPath,
      String? title,
      int id,
      String? overview,
      int? voteCount,
      double? voteAverage,
      int? runtime,
      String? releaseDate});
}

/// @nodoc
class _$DetailsFilmModelCopyWithImpl<$Res, $Val extends DetailsFilmModel>
    implements $DetailsFilmModelCopyWith<$Res> {
  _$DetailsFilmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? title = freezed,
    Object? id = null,
    Object? overview = freezed,
    Object? voteCount = freezed,
    Object? voteAverage = freezed,
    Object? runtime = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsFilmModelCopyWith<$Res>
    implements $DetailsFilmModelCopyWith<$Res> {
  factory _$$_DetailsFilmModelCopyWith(
          _$_DetailsFilmModel value, $Res Function(_$_DetailsFilmModel) then) =
      __$$_DetailsFilmModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? posterPath,
      String? title,
      int id,
      String? overview,
      int? voteCount,
      double? voteAverage,
      int? runtime,
      String? releaseDate});
}

/// @nodoc
class __$$_DetailsFilmModelCopyWithImpl<$Res>
    extends _$DetailsFilmModelCopyWithImpl<$Res, _$_DetailsFilmModel>
    implements _$$_DetailsFilmModelCopyWith<$Res> {
  __$$_DetailsFilmModelCopyWithImpl(
      _$_DetailsFilmModel _value, $Res Function(_$_DetailsFilmModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = freezed,
    Object? title = freezed,
    Object? id = null,
    Object? overview = freezed,
    Object? voteCount = freezed,
    Object? voteAverage = freezed,
    Object? runtime = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_$_DetailsFilmModel(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      runtime: freezed == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailsFilmModel implements _DetailsFilmModel {
  _$_DetailsFilmModel(
      {this.posterPath,
      this.title,
      required this.id,
      this.overview,
      this.voteCount,
      this.voteAverage,
      this.runtime,
      this.releaseDate});

  factory _$_DetailsFilmModel.fromJson(Map<String, dynamic> json) =>
      _$$_DetailsFilmModelFromJson(json);

  @override
  final String? posterPath;
  @override
  final String? title;
  @override
  final int id;
  @override
  final String? overview;
  @override
  final int? voteCount;
  @override
  final double? voteAverage;
  @override
  final int? runtime;
  @override
  final String? releaseDate;

  @override
  String toString() {
    return 'DetailsFilmModel(posterPath: $posterPath, title: $title, id: $id, overview: $overview, voteCount: $voteCount, voteAverage: $voteAverage, runtime: $runtime, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsFilmModel &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, posterPath, title, id, overview,
      voteCount, voteAverage, runtime, releaseDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsFilmModelCopyWith<_$_DetailsFilmModel> get copyWith =>
      __$$_DetailsFilmModelCopyWithImpl<_$_DetailsFilmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailsFilmModelToJson(
      this,
    );
  }
}

abstract class _DetailsFilmModel implements DetailsFilmModel {
  factory _DetailsFilmModel(
      {final String? posterPath,
      final String? title,
      required final int id,
      final String? overview,
      final int? voteCount,
      final double? voteAverage,
      final int? runtime,
      final String? releaseDate}) = _$_DetailsFilmModel;

  factory _DetailsFilmModel.fromJson(Map<String, dynamic> json) =
      _$_DetailsFilmModel.fromJson;

  @override
  String? get posterPath;
  @override
  String? get title;
  @override
  int get id;
  @override
  String? get overview;
  @override
  int? get voteCount;
  @override
  double? get voteAverage;
  @override
  int? get runtime;
  @override
  String? get releaseDate;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsFilmModelCopyWith<_$_DetailsFilmModel> get copyWith =>
      throw _privateConstructorUsedError;
}
