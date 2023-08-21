part of 'details_cubit.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    DetailsFilmModel? film,
    DetailsSeriesModel? series,
  }) = _DetailsState;
}
