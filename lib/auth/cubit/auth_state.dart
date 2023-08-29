part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Status.initial) Status status,
    String? errorMessage,
    UserModel? userModel,
  }) = _AuthState;
}
