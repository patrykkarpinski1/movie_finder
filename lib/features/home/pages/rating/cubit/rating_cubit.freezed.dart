// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RatingState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  MovieModel? get movies => throw _privateConstructorUsedError;
  Map<int, bool>? get ratingStatus => throw _privateConstructorUsedError;
  bool? get hasChanged => throw _privateConstructorUsedError;
  TvSeriesModel? get series => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingStateCopyWith<RatingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingStateCopyWith<$Res> {
  factory $RatingStateCopyWith(
          RatingState value, $Res Function(RatingState) then) =
      _$RatingStateCopyWithImpl<$Res, RatingState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      MovieModel? movies,
      Map<int, bool>? ratingStatus,
      bool? hasChanged,
      TvSeriesModel? series});

  $MovieModelCopyWith<$Res>? get movies;
  $TvSeriesModelCopyWith<$Res>? get series;
}

/// @nodoc
class _$RatingStateCopyWithImpl<$Res, $Val extends RatingState>
    implements $RatingStateCopyWith<$Res> {
  _$RatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? movies = freezed,
    Object? ratingStatus = freezed,
    Object? hasChanged = freezed,
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
      movies: freezed == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as MovieModel?,
      ratingStatus: freezed == ratingStatus
          ? _value.ratingStatus
          : ratingStatus // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>?,
      hasChanged: freezed == hasChanged
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as TvSeriesModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MovieModelCopyWith<$Res>? get movies {
    if (_value.movies == null) {
      return null;
    }

    return $MovieModelCopyWith<$Res>(_value.movies!, (value) {
      return _then(_value.copyWith(movies: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TvSeriesModelCopyWith<$Res>? get series {
    if (_value.series == null) {
      return null;
    }

    return $TvSeriesModelCopyWith<$Res>(_value.series!, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RatingStateCopyWith<$Res>
    implements $RatingStateCopyWith<$Res> {
  factory _$$_RatingStateCopyWith(
          _$_RatingState value, $Res Function(_$_RatingState) then) =
      __$$_RatingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      MovieModel? movies,
      Map<int, bool>? ratingStatus,
      bool? hasChanged,
      TvSeriesModel? series});

  @override
  $MovieModelCopyWith<$Res>? get movies;
  @override
  $TvSeriesModelCopyWith<$Res>? get series;
}

/// @nodoc
class __$$_RatingStateCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$_RatingState>
    implements _$$_RatingStateCopyWith<$Res> {
  __$$_RatingStateCopyWithImpl(
      _$_RatingState _value, $Res Function(_$_RatingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? movies = freezed,
    Object? ratingStatus = freezed,
    Object? hasChanged = freezed,
    Object? series = freezed,
  }) {
    return _then(_$_RatingState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      movies: freezed == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as MovieModel?,
      ratingStatus: freezed == ratingStatus
          ? _value._ratingStatus
          : ratingStatus // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>?,
      hasChanged: freezed == hasChanged
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as TvSeriesModel?,
    ));
  }
}

/// @nodoc

class _$_RatingState implements _RatingState {
  const _$_RatingState(
      {this.status = Status.initial,
      this.errorMessage,
      this.movies,
      final Map<int, bool>? ratingStatus,
      this.hasChanged,
      this.series})
      : _ratingStatus = ratingStatus;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final MovieModel? movies;
  final Map<int, bool>? _ratingStatus;
  @override
  Map<int, bool>? get ratingStatus {
    final value = _ratingStatus;
    if (value == null) return null;
    if (_ratingStatus is EqualUnmodifiableMapView) return _ratingStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? hasChanged;
  @override
  final TvSeriesModel? series;

  @override
  String toString() {
    return 'RatingState(status: $status, errorMessage: $errorMessage, movies: $movies, ratingStatus: $ratingStatus, hasChanged: $hasChanged, series: $series)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.movies, movies) || other.movies == movies) &&
            const DeepCollectionEquality()
                .equals(other._ratingStatus, _ratingStatus) &&
            (identical(other.hasChanged, hasChanged) ||
                other.hasChanged == hasChanged) &&
            (identical(other.series, series) || other.series == series));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, movies,
      const DeepCollectionEquality().hash(_ratingStatus), hasChanged, series);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingStateCopyWith<_$_RatingState> get copyWith =>
      __$$_RatingStateCopyWithImpl<_$_RatingState>(this, _$identity);
}

abstract class _RatingState implements RatingState {
  const factory _RatingState(
      {final Status status,
      final String? errorMessage,
      final MovieModel? movies,
      final Map<int, bool>? ratingStatus,
      final bool? hasChanged,
      final TvSeriesModel? series}) = _$_RatingState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  MovieModel? get movies;
  @override
  Map<int, bool>? get ratingStatus;
  @override
  bool? get hasChanged;
  @override
  TvSeriesModel? get series;
  @override
  @JsonKey(ignore: true)
  _$$_RatingStateCopyWith<_$_RatingState> get copyWith =>
      throw _privateConstructorUsedError;
}
