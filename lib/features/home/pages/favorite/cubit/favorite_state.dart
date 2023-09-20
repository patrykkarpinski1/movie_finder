part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    AccountMovieModel? movies,
    Map<int, bool>? favoriteStatus,
    bool? hasChanged,
  }) = _FavoriteState;
}
