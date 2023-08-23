// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _SearchModel.fromJson(json);
}

/// @nodoc
mixin _$SearchModel {
  int? get page => throw _privateConstructorUsedError;
  List<Results>? get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call(
      {int? page, List<Results>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchModelCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$_SearchModelCopyWith(
          _$_SearchModel value, $Res Function(_$_SearchModel) then) =
      __$$_SearchModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page, List<Results>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class __$$_SearchModelCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$_SearchModel>
    implements _$$_SearchModelCopyWith<$Res> {
  __$$_SearchModelCopyWithImpl(
      _$_SearchModel _value, $Res Function(_$_SearchModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_SearchModel(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchModel implements _SearchModel {
  _$_SearchModel(
      {required this.page,
      required final List<Results>? results,
      required this.totalPages,
      required this.totalResults})
      : _results = results;

  factory _$_SearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchModelFromJson(json);

  @override
  final int? page;
  final List<Results>? _results;
  @override
  List<Results>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPages;
  @override
  final int? totalResults;

  @override
  String toString() {
    return 'SearchModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchModel &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      __$$_SearchModelCopyWithImpl<_$_SearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchModelToJson(
      this,
    );
  }
}

abstract class _SearchModel implements SearchModel {
  factory _SearchModel(
      {required final int? page,
      required final List<Results>? results,
      required final int? totalPages,
      required final int? totalResults}) = _$_SearchModel;

  factory _SearchModel.fromJson(Map<String, dynamic> json) =
      _$_SearchModel.fromJson;

  @override
  int? get page;
  @override
  List<Results>? get results;
  @override
  int? get totalPages;
  @override
  int? get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_SearchModelCopyWith<_$_SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return _Results.fromJson(json);
}

/// @nodoc
mixin _$Results {
  String? get posterPath => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  MediaType? get type => throw _privateConstructorUsedError;

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
      {String? posterPath,
      String? name,
      String? title,
      int id,
      MediaType? type});
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
    Object? posterPath = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? id = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType?,
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
      {String? posterPath,
      String? name,
      String? title,
      int id,
      MediaType? type});
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
    Object? posterPath = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? id = null,
    Object? type = freezed,
  }) {
    return _then(_$_Results(
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Results implements _Results {
  _$_Results(
      {this.posterPath, this.name, this.title, required this.id, this.type});

  factory _$_Results.fromJson(Map<String, dynamic> json) =>
      _$$_ResultsFromJson(json);

  @override
  final String? posterPath;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final int id;
  @override
  final MediaType? type;

  @override
  String toString() {
    return 'Results(posterPath: $posterPath, name: $name, title: $title, id: $id, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Results &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, posterPath, name, title, id, type);

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
      {final String? posterPath,
      final String? name,
      final String? title,
      required final int id,
      final MediaType? type}) = _$_Results;

  factory _Results.fromJson(Map<String, dynamic> json) = _$_Results.fromJson;

  @override
  String? get posterPath;
  @override
  String? get name;
  @override
  String? get title;
  @override
  int get id;
  @override
  MediaType? get type;
  @override
  @JsonKey(ignore: true)
  _$$_ResultsCopyWith<_$_Results> get copyWith =>
      throw _privateConstructorUsedError;
}
