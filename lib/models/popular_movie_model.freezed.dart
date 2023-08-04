// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PopularMovieModel _$PopularMovieModelFromJson(Map<String, dynamic> json) {
  return _PopularMovieModel.fromJson(json);
}

/// @nodoc
mixin _$PopularMovieModel {
  int get page => throw _privateConstructorUsedError;
  List<Results> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularMovieModelCopyWith<PopularMovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularMovieModelCopyWith<$Res> {
  factory $PopularMovieModelCopyWith(
          PopularMovieModel value, $Res Function(PopularMovieModel) then) =
      _$PopularMovieModelCopyWithImpl<$Res, PopularMovieModel>;
  @useResult
  $Res call({int page, List<Results> results});
}

/// @nodoc
class _$PopularMovieModelCopyWithImpl<$Res, $Val extends PopularMovieModel>
    implements $PopularMovieModelCopyWith<$Res> {
  _$PopularMovieModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PopularMovieModelCopyWith<$Res>
    implements $PopularMovieModelCopyWith<$Res> {
  factory _$$_PopularMovieModelCopyWith(_$_PopularMovieModel value,
          $Res Function(_$_PopularMovieModel) then) =
      __$$_PopularMovieModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, List<Results> results});
}

/// @nodoc
class __$$_PopularMovieModelCopyWithImpl<$Res>
    extends _$PopularMovieModelCopyWithImpl<$Res, _$_PopularMovieModel>
    implements _$$_PopularMovieModelCopyWith<$Res> {
  __$$_PopularMovieModelCopyWithImpl(
      _$_PopularMovieModel _value, $Res Function(_$_PopularMovieModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
  }) {
    return _then(_$_PopularMovieModel(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PopularMovieModel implements _PopularMovieModel {
  _$_PopularMovieModel(
      {required this.page, required final List<Results> results})
      : _results = results;

  factory _$_PopularMovieModel.fromJson(Map<String, dynamic> json) =>
      _$$_PopularMovieModelFromJson(json);

  @override
  final int page;
  final List<Results> _results;
  @override
  List<Results> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PopularMovieModel(page: $page, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PopularMovieModel &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, page, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PopularMovieModelCopyWith<_$_PopularMovieModel> get copyWith =>
      __$$_PopularMovieModelCopyWithImpl<_$_PopularMovieModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PopularMovieModelToJson(
      this,
    );
  }
}

abstract class _PopularMovieModel implements PopularMovieModel {
  factory _PopularMovieModel(
      {required final int page,
      required final List<Results> results}) = _$_PopularMovieModel;

  factory _PopularMovieModel.fromJson(Map<String, dynamic> json) =
      _$_PopularMovieModel.fromJson;

  @override
  int get page;
  @override
  List<Results> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PopularMovieModelCopyWith<_$_PopularMovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return _Results.fromJson(json);
}

/// @nodoc
mixin _$Results {
  String? get backdropPath => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  double? get voteAverage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultsCopyWith<Results> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsCopyWith<$Res> {
  factory $ResultsCopyWith(Results value, $Res Function(Results) then) =
      _$ResultsCopyWithImpl<$Res, Results>;
  @useResult
  $Res call(
      {String? backdropPath,
      String? title,
      String? releaseDate,
      double? voteAverage,
      int id});
}

/// @nodoc
class _$ResultsCopyWithImpl<$Res, $Val extends Results>
    implements $ResultsCopyWith<$Res> {
  _$ResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdropPath = freezed,
    Object? title = freezed,
    Object? releaseDate = freezed,
    Object? voteAverage = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultsCopyWith<$Res> implements $ResultsCopyWith<$Res> {
  factory _$$_ResultsCopyWith(
          _$_Results value, $Res Function(_$_Results) then) =
      __$$_ResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? backdropPath,
      String? title,
      String? releaseDate,
      double? voteAverage,
      int id});
}

/// @nodoc
class __$$_ResultsCopyWithImpl<$Res>
    extends _$ResultsCopyWithImpl<$Res, _$_Results>
    implements _$$_ResultsCopyWith<$Res> {
  __$$_ResultsCopyWithImpl(_$_Results _value, $Res Function(_$_Results) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdropPath = freezed,
    Object? title = freezed,
    Object? releaseDate = freezed,
    Object? voteAverage = freezed,
    Object? id = null,
  }) {
    return _then(_$_Results(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Results implements _Results {
  _$_Results(
      {this.backdropPath,
      this.title,
      this.releaseDate,
      this.voteAverage,
      required this.id});

  factory _$_Results.fromJson(Map<String, dynamic> json) =>
      _$$_ResultsFromJson(json);

  @override
  final String? backdropPath;
  @override
  final String? title;
  @override
  final String? releaseDate;
  @override
  final double? voteAverage;
  @override
  final int id;

  @override
  String toString() {
    return 'Results(backdropPath: $backdropPath, title: $title, releaseDate: $releaseDate, voteAverage: $voteAverage, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Results &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, backdropPath, title, releaseDate, voteAverage, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultsCopyWith<_$_Results> get copyWith =>
      __$$_ResultsCopyWithImpl<_$_Results>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultsToJson(
      this,
    );
  }
}

abstract class _Results implements Results {
  factory _Results(
      {final String? backdropPath,
      final String? title,
      final String? releaseDate,
      final double? voteAverage,
      required final int id}) = _$_Results;

  factory _Results.fromJson(Map<String, dynamic> json) = _$_Results.fromJson;

  @override
  String? get backdropPath;
  @override
  String? get title;
  @override
  String? get releaseDate;
  @override
  double? get voteAverage;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ResultsCopyWith<_$_Results> get copyWith =>
      throw _privateConstructorUsedError;
}
