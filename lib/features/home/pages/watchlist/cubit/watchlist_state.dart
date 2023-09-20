part of 'watchlist_cubit.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    MovieModel? movies,
    Map<int, bool>? watchlistStatus,
    bool? hasChanged,
  }) = _WatchlistState;
}
