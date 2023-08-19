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
  String? get backdropPath => throw _privateConstructorUsedError;
  String? get originalTitle => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

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
  $Res call({String? backdropPath, String? originalTitle, int id});
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
    Object? backdropPath = freezed,
    Object? originalTitle = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({String? backdropPath, String? originalTitle, int id});
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
    Object? backdropPath = freezed,
    Object? originalTitle = freezed,
    Object? id = null,
  }) {
    return _then(_$_DetailsFilmModel(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailsFilmModel implements _DetailsFilmModel {
  _$_DetailsFilmModel(
      {this.backdropPath, this.originalTitle, required this.id});

  factory _$_DetailsFilmModel.fromJson(Map<String, dynamic> json) =>
      _$$_DetailsFilmModelFromJson(json);

  @override
  final String? backdropPath;
  @override
  final String? originalTitle;
  @override
  final int id;

  @override
  String toString() {
    return 'DetailsFilmModel(backdropPath: $backdropPath, originalTitle: $originalTitle, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsFilmModel &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, backdropPath, originalTitle, id);

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
      {final String? backdropPath,
      final String? originalTitle,
      required final int id}) = _$_DetailsFilmModel;

  factory _DetailsFilmModel.fromJson(Map<String, dynamic> json) =
      _$_DetailsFilmModel.fromJson;

  @override
  String? get backdropPath;
  @override
  String? get originalTitle;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsFilmModelCopyWith<_$_DetailsFilmModel> get copyWith =>
      throw _privateConstructorUsedError;
}
