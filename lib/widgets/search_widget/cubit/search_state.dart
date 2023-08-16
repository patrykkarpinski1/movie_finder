part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    SearchModel? films,
    SearchModel? series,
  }) = _SearchState;
}
