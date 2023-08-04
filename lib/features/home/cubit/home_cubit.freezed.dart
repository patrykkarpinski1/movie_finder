// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  PopularMovieModel? get popularMovie => throw _privateConstructorUsedError;
  TopRatedMovieModel? get topRatedMovie => throw _privateConstructorUsedError;
  TvSeriesModel? get topRatedTvSeries => throw _privateConstructorUsedError;
  TvSeriesModel? get popularTvSeries => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      PopularMovieModel? popularMovie,
      TopRatedMovieModel? topRatedMovie,
      TvSeriesModel? topRatedTvSeries,
      TvSeriesModel? popularTvSeries});

  $PopularMovieModelCopyWith<$Res>? get popularMovie;
  $TopRatedMovieModelCopyWith<$Res>? get topRatedMovie;
  $TvSeriesModelCopyWith<$Res>? get topRatedTvSeries;
  $TvSeriesModelCopyWith<$Res>? get popularTvSeries;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? popularMovie = freezed,
    Object? topRatedMovie = freezed,
    Object? topRatedTvSeries = freezed,
    Object? popularTvSeries = freezed,
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
      popularMovie: freezed == popularMovie
          ? _value.popularMovie
          : popularMovie // ignore: cast_nullable_to_non_nullable
              as PopularMovieModel?,
      topRatedMovie: freezed == topRatedMovie
          ? _value.topRatedMovie
          : topRatedMovie // ignore: cast_nullable_to_non_nullable
              as TopRatedMovieModel?,
      topRatedTvSeries: freezed == topRatedTvSeries
          ? _value.topRatedTvSeries
          : topRatedTvSeries // ignore: cast_nullable_to_non_nullable
              as TvSeriesModel?,
      popularTvSeries: freezed == popularTvSeries
          ? _value.popularTvSeries
          : popularTvSeries // ignore: cast_nullable_to_non_nullable
              as TvSeriesModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PopularMovieModelCopyWith<$Res>? get popularMovie {
    if (_value.popularMovie == null) {
      return null;
    }

    return $PopularMovieModelCopyWith<$Res>(_value.popularMovie!, (value) {
      return _then(_value.copyWith(popularMovie: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TopRatedMovieModelCopyWith<$Res>? get topRatedMovie {
    if (_value.topRatedMovie == null) {
      return null;
    }

    return $TopRatedMovieModelCopyWith<$Res>(_value.topRatedMovie!, (value) {
      return _then(_value.copyWith(topRatedMovie: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TvSeriesModelCopyWith<$Res>? get topRatedTvSeries {
    if (_value.topRatedTvSeries == null) {
      return null;
    }

    return $TvSeriesModelCopyWith<$Res>(_value.topRatedTvSeries!, (value) {
      return _then(_value.copyWith(topRatedTvSeries: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TvSeriesModelCopyWith<$Res>? get popularTvSeries {
    if (_value.popularTvSeries == null) {
      return null;
    }

    return $TvSeriesModelCopyWith<$Res>(_value.popularTvSeries!, (value) {
      return _then(_value.copyWith(popularTvSeries: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      PopularMovieModel? popularMovie,
      TopRatedMovieModel? topRatedMovie,
      TvSeriesModel? topRatedTvSeries,
      TvSeriesModel? popularTvSeries});

  @override
  $PopularMovieModelCopyWith<$Res>? get popularMovie;
  @override
  $TopRatedMovieModelCopyWith<$Res>? get topRatedMovie;
  @override
  $TvSeriesModelCopyWith<$Res>? get topRatedTvSeries;
  @override
  $TvSeriesModelCopyWith<$Res>? get popularTvSeries;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? popularMovie = freezed,
    Object? topRatedMovie = freezed,
    Object? topRatedTvSeries = freezed,
    Object? popularTvSeries = freezed,
  }) {
    return _then(_$_HomeState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      popularMovie: freezed == popularMovie
          ? _value.popularMovie
          : popularMovie // ignore: cast_nullable_to_non_nullable
              as PopularMovieModel?,
      topRatedMovie: freezed == topRatedMovie
          ? _value.topRatedMovie
          : topRatedMovie // ignore: cast_nullable_to_non_nullable
              as TopRatedMovieModel?,
      topRatedTvSeries: freezed == topRatedTvSeries
          ? _value.topRatedTvSeries
          : topRatedTvSeries // ignore: cast_nullable_to_non_nullable
              as TvSeriesModel?,
      popularTvSeries: freezed == popularTvSeries
          ? _value.popularTvSeries
          : popularTvSeries // ignore: cast_nullable_to_non_nullable
              as TvSeriesModel?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {this.status = Status.initial,
      this.errorMessage,
      this.popularMovie,
      this.topRatedMovie,
      this.topRatedTvSeries,
      this.popularTvSeries});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final PopularMovieModel? popularMovie;
  @override
  final TopRatedMovieModel? topRatedMovie;
  @override
  final TvSeriesModel? topRatedTvSeries;
  @override
  final TvSeriesModel? popularTvSeries;

  @override
  String toString() {
    return 'HomeState(status: $status, errorMessage: $errorMessage, popularMovie: $popularMovie, topRatedMovie: $topRatedMovie, topRatedTvSeries: $topRatedTvSeries, popularTvSeries: $popularTvSeries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.popularMovie, popularMovie) ||
                other.popularMovie == popularMovie) &&
            (identical(other.topRatedMovie, topRatedMovie) ||
                other.topRatedMovie == topRatedMovie) &&
            (identical(other.topRatedTvSeries, topRatedTvSeries) ||
                other.topRatedTvSeries == topRatedTvSeries) &&
            (identical(other.popularTvSeries, popularTvSeries) ||
                other.popularTvSeries == popularTvSeries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      popularMovie, topRatedMovie, topRatedTvSeries, popularTvSeries);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final Status status,
      final String? errorMessage,
      final PopularMovieModel? popularMovie,
      final TopRatedMovieModel? topRatedMovie,
      final TvSeriesModel? topRatedTvSeries,
      final TvSeriesModel? popularTvSeries}) = _$_HomeState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  PopularMovieModel? get popularMovie;
  @override
  TopRatedMovieModel? get topRatedMovie;
  @override
  TvSeriesModel? get topRatedTvSeries;
  @override
  TvSeriesModel? get popularTvSeries;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
