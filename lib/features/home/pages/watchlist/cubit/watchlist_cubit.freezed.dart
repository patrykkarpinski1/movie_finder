// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WatchlistState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  MovieModel? get movies => throw _privateConstructorUsedError;
  Map<int, bool>? get watchlistStatus => throw _privateConstructorUsedError;
  bool? get hasChanged => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WatchlistStateCopyWith<WatchlistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistStateCopyWith<$Res> {
  factory $WatchlistStateCopyWith(
          WatchlistState value, $Res Function(WatchlistState) then) =
      _$WatchlistStateCopyWithImpl<$Res, WatchlistState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      MovieModel? movies,
      Map<int, bool>? watchlistStatus,
      bool? hasChanged});

  $MovieModelCopyWith<$Res>? get movies;
}

/// @nodoc
class _$WatchlistStateCopyWithImpl<$Res, $Val extends WatchlistState>
    implements $WatchlistStateCopyWith<$Res> {
  _$WatchlistStateCopyWithImpl(this._value, this._then);

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
    Object? watchlistStatus = freezed,
    Object? hasChanged = freezed,
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
      watchlistStatus: freezed == watchlistStatus
          ? _value.watchlistStatus
          : watchlistStatus // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>?,
      hasChanged: freezed == hasChanged
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
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
}

/// @nodoc
abstract class _$$_WatchlistStateCopyWith<$Res>
    implements $WatchlistStateCopyWith<$Res> {
  factory _$$_WatchlistStateCopyWith(
          _$_WatchlistState value, $Res Function(_$_WatchlistState) then) =
      __$$_WatchlistStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      MovieModel? movies,
      Map<int, bool>? watchlistStatus,
      bool? hasChanged});

  @override
  $MovieModelCopyWith<$Res>? get movies;
}

/// @nodoc
class __$$_WatchlistStateCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$_WatchlistState>
    implements _$$_WatchlistStateCopyWith<$Res> {
  __$$_WatchlistStateCopyWithImpl(
      _$_WatchlistState _value, $Res Function(_$_WatchlistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? movies = freezed,
    Object? watchlistStatus = freezed,
    Object? hasChanged = freezed,
  }) {
    return _then(_$_WatchlistState(
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
      watchlistStatus: freezed == watchlistStatus
          ? _value._watchlistStatus
          : watchlistStatus // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>?,
      hasChanged: freezed == hasChanged
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_WatchlistState implements _WatchlistState {
  const _$_WatchlistState(
      {this.status = Status.initial,
      this.errorMessage,
      this.movies,
      final Map<int, bool>? watchlistStatus,
      this.hasChanged})
      : _watchlistStatus = watchlistStatus;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final MovieModel? movies;
  final Map<int, bool>? _watchlistStatus;
  @override
  Map<int, bool>? get watchlistStatus {
    final value = _watchlistStatus;
    if (value == null) return null;
    if (_watchlistStatus is EqualUnmodifiableMapView) return _watchlistStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? hasChanged;

  @override
  String toString() {
    return 'WatchlistState(status: $status, errorMessage: $errorMessage, movies: $movies, watchlistStatus: $watchlistStatus, hasChanged: $hasChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WatchlistState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.movies, movies) || other.movies == movies) &&
            const DeepCollectionEquality()
                .equals(other._watchlistStatus, _watchlistStatus) &&
            (identical(other.hasChanged, hasChanged) ||
                other.hasChanged == hasChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, movies,
      const DeepCollectionEquality().hash(_watchlistStatus), hasChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WatchlistStateCopyWith<_$_WatchlistState> get copyWith =>
      __$$_WatchlistStateCopyWithImpl<_$_WatchlistState>(this, _$identity);
}

abstract class _WatchlistState implements WatchlistState {
  const factory _WatchlistState(
      {final Status status,
      final String? errorMessage,
      final MovieModel? movies,
      final Map<int, bool>? watchlistStatus,
      final bool? hasChanged}) = _$_WatchlistState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  MovieModel? get movies;
  @override
  Map<int, bool>? get watchlistStatus;
  @override
  bool? get hasChanged;
  @override
  @JsonKey(ignore: true)
  _$$_WatchlistStateCopyWith<_$_WatchlistState> get copyWith =>
      throw _privateConstructorUsedError;
}
