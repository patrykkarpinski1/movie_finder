// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  AccountMovieModel? get movies => throw _privateConstructorUsedError;
  Map<int, bool>? get favoriteStatus => throw _privateConstructorUsedError;
  bool? get hasChanged => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      AccountMovieModel? movies,
      Map<int, bool>? favoriteStatus,
      bool? hasChanged});

  $AccountMovieModelCopyWith<$Res>? get movies;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

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
    Object? favoriteStatus = freezed,
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
              as AccountMovieModel?,
      favoriteStatus: freezed == favoriteStatus
          ? _value.favoriteStatus
          : favoriteStatus // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>?,
      hasChanged: freezed == hasChanged
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountMovieModelCopyWith<$Res>? get movies {
    if (_value.movies == null) {
      return null;
    }

    return $AccountMovieModelCopyWith<$Res>(_value.movies!, (value) {
      return _then(_value.copyWith(movies: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FavoriteStateCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$_FavoriteStateCopyWith(
          _$_FavoriteState value, $Res Function(_$_FavoriteState) then) =
      __$$_FavoriteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      AccountMovieModel? movies,
      Map<int, bool>? favoriteStatus,
      bool? hasChanged});

  @override
  $AccountMovieModelCopyWith<$Res>? get movies;
}

/// @nodoc
class __$$_FavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$_FavoriteState>
    implements _$$_FavoriteStateCopyWith<$Res> {
  __$$_FavoriteStateCopyWithImpl(
      _$_FavoriteState _value, $Res Function(_$_FavoriteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? movies = freezed,
    Object? favoriteStatus = freezed,
    Object? hasChanged = freezed,
  }) {
    return _then(_$_FavoriteState(
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
              as AccountMovieModel?,
      favoriteStatus: freezed == favoriteStatus
          ? _value._favoriteStatus
          : favoriteStatus // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>?,
      hasChanged: freezed == hasChanged
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FavoriteState implements _FavoriteState {
  const _$_FavoriteState(
      {this.status = Status.initial,
      this.errorMessage,
      this.movies,
      final Map<int, bool>? favoriteStatus,
      this.hasChanged})
      : _favoriteStatus = favoriteStatus;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final AccountMovieModel? movies;
  final Map<int, bool>? _favoriteStatus;
  @override
  Map<int, bool>? get favoriteStatus {
    final value = _favoriteStatus;
    if (value == null) return null;
    if (_favoriteStatus is EqualUnmodifiableMapView) return _favoriteStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? hasChanged;

  @override
  String toString() {
    return 'FavoriteState(status: $status, errorMessage: $errorMessage, movies: $movies, favoriteStatus: $favoriteStatus, hasChanged: $hasChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.movies, movies) || other.movies == movies) &&
            const DeepCollectionEquality()
                .equals(other._favoriteStatus, _favoriteStatus) &&
            (identical(other.hasChanged, hasChanged) ||
                other.hasChanged == hasChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, movies,
      const DeepCollectionEquality().hash(_favoriteStatus), hasChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      __$$_FavoriteStateCopyWithImpl<_$_FavoriteState>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {final Status status,
      final String? errorMessage,
      final AccountMovieModel? movies,
      final Map<int, bool>? favoriteStatus,
      final bool? hasChanged}) = _$_FavoriteState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  AccountMovieModel? get movies;
  @override
  Map<int, bool>? get favoriteStatus;
  @override
  bool? get hasChanged;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
