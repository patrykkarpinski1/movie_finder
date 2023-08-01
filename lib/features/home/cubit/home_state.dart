part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    PopularMovieModel? popularMovie,
    TopRatedMovieModel? topRatedMovie,
  }) = _HomeState;
}
