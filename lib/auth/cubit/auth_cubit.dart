import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/account/user_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:uni_links/uni_links.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.accountRepository) : super(const AuthState());
  final AccountRepository accountRepository;

  Future<void> authenticateUser() async {
    try {
      emit(const AuthState(status: Status.loading));

      final generatedAuth = await accountRepository.generateRequestToken();

      if (generatedAuth == null || generatedAuth.requestToken == null) {
        emit(const AuthState(
            errorMessage: 'The request token could not be obtained.'));
        return;
      }

      accountRepository.openAuthenticationUrl(generatedAuth.requestToken!);

      Uri? uri;
      try {
        uri = await getInitialUri();
      } on FormatException {
        emit(const AuthState(
            errorMessage: "Invalid URI format.", status: Status.error));
        return;
      } catch (error) {
        emit(AuthState(errorMessage: error.toString(), status: Status.error));
        return;
      }

      StreamSubscription? sub;
      try {
        if (uri == null) {
          sub = uriLinkStream.listen((Uri? incomingUri) {
            if (incomingUri != null) {
              uri = incomingUri;
              sub?.cancel();
            }
          });

          int timeoutCounter = 0;
          while (uri == null && timeoutCounter < 150) {
            await Future.delayed(const Duration(milliseconds: 100));
            timeoutCounter++;
          }

          if (uri == null) {
            emit(const AuthState(
                errorMessage: "Timeout waiting for URI.",
                status: Status.error));
            return;
          }
        }
      } finally {
        sub?.cancel();
      }

      final authResult =
          await accountRepository.createSessionId(generatedAuth.requestToken!);

      if (authResult == null || authResult.sessionId == null) {
        emit(const AuthState(
            errorMessage: 'The session identifier could not be obtained.'));
        return;
      }

      emit(AuthState(authModel: authResult, status: Status.success));
    } catch (error) {
      emit(AuthState(errorMessage: error.toString(), status: Status.error));
    }
  }
}
