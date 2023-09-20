part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    MovieModel? movies,
    Map<int, bool>? favoriteStatus,
    bool? hasChanged,
    TvSeriesModel? series,
  }) = _FavoriteState;
}
