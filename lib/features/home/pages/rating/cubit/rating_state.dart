part of 'rating_cubit.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    MovieModel? movies,
  }) = _RatingState;
}
