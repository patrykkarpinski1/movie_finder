import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/account/auth_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.accountRepository) : super(const AuthState());
  final AccountRepository accountRepository;
  Future<void> authenticateUser(
      {required String username, required String password}) async {
    try {
      emit(const AuthState(status: Status.loading));
      String sessionId = await accountRepository.loginUser(username, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sessionId', sessionId);

      emit(const AuthState(status: Status.success));
    } catch (error) {
      emit(AuthState(errorMessage: error.toString(), status: Status.error));
    }
  }

  Future<void> getSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionId = prefs.getString('sessionId');
    if (sessionId != null && sessionId.isNotEmpty) {
      emit(AuthState(
          authModel: AuthModel(sessionId: sessionId),
          status: Status.authenticated));
    } else {
      emit(const AuthState(status: Status.unauthenticated));
    }
  }

  Future<void> deleteSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final sessionId = prefs.getString('sessionId');

      if (sessionId == null || sessionId.isEmpty) {
        emit(const AuthState(
            errorMessage: "Session ID not found", status: Status.error));
      }

      await accountRepository.deleteSession(sessionId!);

      await prefs.remove('sessionId');

      emit(const AuthState(status: Status.unauthenticated));
    } catch (error) {
      emit(AuthState(errorMessage: error.toString(), status: Status.error));
    }
  }
}
