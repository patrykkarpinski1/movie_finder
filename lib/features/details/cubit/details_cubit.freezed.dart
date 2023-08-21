// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  DetailsFilmModel? get film => throw _privateConstructorUsedError;
  DetailsSeriesModel? get series => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsStateCopyWith<DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) then) =
      _$DetailsStateCopyWithImpl<$Res, DetailsState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      DetailsFilmModel? film,
      DetailsSeriesModel? series});

  $DetailsFilmModelCopyWith<$Res>? get film;
  $DetailsSeriesModelCopyWith<$Res>? get series;
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res, $Val extends DetailsState>
    implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? film = freezed,
    Object? series = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      film: freezed == film
          ? _value.film
          : film // ignore: cast_nullable_to_non_nullable
              as DetailsFilmModel?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as DetailsSeriesModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailsFilmModelCopyWith<$Res>? get film {
    if (_value.film == null) {
      return null;
    }

    return $DetailsFilmModelCopyWith<$Res>(_value.film!, (value) {
      return _then(_value.copyWith(film: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailsSeriesModelCopyWith<$Res>? get series {
    if (_value.series == null) {
      return null;
    }

    return $DetailsSeriesModelCopyWith<$Res>(_value.series!, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailsStateCopyWith<$Res>
    implements $DetailsStateCopyWith<$Res> {
  factory _$$_DetailsStateCopyWith(
          _$_DetailsState value, $Res Function(_$_DetailsState) then) =
      __$$_DetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      DetailsFilmModel? film,
      DetailsSeriesModel? series});

  @override
  $DetailsFilmModelCopyWith<$Res>? get film;
  @override
  $DetailsSeriesModelCopyWith<$Res>? get series;
}

/// @nodoc
class __$$_DetailsStateCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$_DetailsState>
    implements _$$_DetailsStateCopyWith<$Res> {
  __$$_DetailsStateCopyWithImpl(
      _$_DetailsState _value, $Res Function(_$_DetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? film = freezed,
    Object? series = freezed,
  }) {
    return _then(_$_DetailsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      film: freezed == film
          ? _value.film
          : film // ignore: cast_nullable_to_non_nullable
              as DetailsFilmModel?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as DetailsSeriesModel?,
    ));
  }
}

/// @nodoc

class _$_DetailsState implements _DetailsState {
  const _$_DetailsState(
      {this.status = Status.initial,
      this.errorMessage,
      this.film,
      this.series});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final DetailsFilmModel? film;
  @override
  final DetailsSeriesModel? series;

  @override
  String toString() {
    return 'DetailsState(status: $status, errorMessage: $errorMessage, film: $film, series: $series)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.film, film) || other.film == film) &&
            (identical(other.series, series) || other.series == series));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, film, series);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsStateCopyWith<_$_DetailsState> get copyWith =>
      __$$_DetailsStateCopyWithImpl<_$_DetailsState>(this, _$identity);
}

abstract class _DetailsState implements DetailsState {
  const factory _DetailsState(
      {final Status status,
      final String? errorMessage,
      final DetailsFilmModel? film,
      final DetailsSeriesModel? series}) = _$_DetailsState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  DetailsFilmModel? get film;
  @override
  DetailsSeriesModel? get series;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsStateCopyWith<_$_DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
