// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_rated_movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopRatedMovieModel _$TopRatedMovieModelFromJson(Map<String, dynamic> json) {
  return _TopRatedMovieModel.fromJson(json);
}

/// @nodoc
mixin _$TopRatedMovieModel {
  int get page => throw _privateConstructorUsedError;
  List<Results> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopRatedMovieModelCopyWith<TopRatedMovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopRatedMovieModelCopyWith<$Res> {
  factory $TopRatedMovieModelCopyWith(
          TopRatedMovieModel value, $Res Function(TopRatedMovieModel) then) =
      _$TopRatedMovieModelCopyWithImpl<$Res, TopRatedMovieModel>;
  @useResult
  $Res call({int page, List<Results> results});
}

/// @nodoc
class _$TopRatedMovieModelCopyWithImpl<$Res, $Val extends TopRatedMovieModel>
    implements $TopRatedMovieModelCopyWith<$Res> {
  _$TopRatedMovieModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_TopRatedMovieModelCopyWith<$Res>
    implements $TopRatedMovieModelCopyWith<$Res> {
  factory _$$_TopRatedMovieModelCopyWith(_$_TopRatedMovieModel value,
          $Res Function(_$_TopRatedMovieModel) then) =
      __$$_TopRatedMovieModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, List<Results> results});
}

/// @nodoc
class __$$_TopRatedMovieModelCopyWithImpl<$Res>
    extends _$TopRatedMovieModelCopyWithImpl<$Res, _$_TopRatedMovieModel>
    implements _$$_TopRatedMovieModelCopyWith<$Res> {
  __$$_TopRatedMovieModelCopyWithImpl(
      _$_TopRatedMovieModel _value, $Res Function(_$_TopRatedMovieModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
  }) {
    return _then(_$_TopRatedMovieModel(
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
class _$_TopRatedMovieModel implements _TopRatedMovieModel {
  _$_TopRatedMovieModel(
      {required this.page, required final List<Results> results})
      : _results = results;

  factory _$_TopRatedMovieModel.fromJson(Map<String, dynamic> json) =>
      _$$_TopRatedMovieModelFromJson(json);

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
    return 'TopRatedMovieModel(page: $page, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopRatedMovieModel &&
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
  _$$_TopRatedMovieModelCopyWith<_$_TopRatedMovieModel> get copyWith =>
      __$$_TopRatedMovieModelCopyWithImpl<_$_TopRatedMovieModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopRatedMovieModelToJson(
      this,
    );
  }
}

abstract class _TopRatedMovieModel implements TopRatedMovieModel {
  factory _TopRatedMovieModel(
      {required final int page,
      required final List<Results> results}) = _$_TopRatedMovieModel;

  factory _TopRatedMovieModel.fromJson(Map<String, dynamic> json) =
      _$_TopRatedMovieModel.fromJson;

  @override
  int get page;
  @override
  List<Results> get results;
  @override
  @JsonKey(ignore: true)
  _$$_TopRatedMovieModelCopyWith<_$_TopRatedMovieModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return _Results.fromJson(json);
}

/// @nodoc
mixin _$Results {
  String get backdropPath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get voteAverage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  int get voteCount => throw _privateConstructorUsedError;

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
      {String backdropPath,
      String title,
      double voteAverage,
      int id,
      String overview,
      int voteCount});
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
    Object? backdropPath = null,
    Object? title = null,
    Object? voteAverage = null,
    Object? id = null,
    Object? overview = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
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
      {String backdropPath,
      String title,
      double voteAverage,
      int id,
      String overview,
      int voteCount});
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
    Object? backdropPath = null,
    Object? title = null,
    Object? voteAverage = null,
    Object? id = null,
    Object? overview = null,
    Object? voteCount = null,
  }) {
    return _then(_$_Results(
      backdropPath: null == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Results implements _Results {
  _$_Results(
      {required this.backdropPath,
      required this.title,
      required this.voteAverage,
      required this.id,
      required this.overview,
      required this.voteCount});

  factory _$_Results.fromJson(Map<String, dynamic> json) =>
      _$$_ResultsFromJson(json);

  @override
  final String backdropPath;
  @override
  final String title;
  @override
  final double voteAverage;
  @override
  final int id;
  @override
  final String overview;
  @override
  final int voteCount;

  @override
  String toString() {
    return 'Results(backdropPath: $backdropPath, title: $title, voteAverage: $voteAverage, id: $id, overview: $overview, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Results &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, backdropPath, title, voteAverage, id, overview, voteCount);

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
      {required final String backdropPath,
      required final String title,
      required final double voteAverage,
      required final int id,
      required final String overview,
      required final int voteCount}) = _$_Results;

  factory _Results.fromJson(Map<String, dynamic> json) = _$_Results.fromJson;

  @override
  String get backdropPath;
  @override
  String get title;
  @override
  double get voteAverage;
  @override
  int get id;
  @override
  String get overview;
  @override
  int get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$_ResultsCopyWith<_$_Results> get copyWith =>
      throw _privateConstructorUsedError;
}
