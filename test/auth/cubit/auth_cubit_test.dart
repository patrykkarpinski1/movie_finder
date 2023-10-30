import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';
import 'package:movie_finder/models/account/auth_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late AuthCubit sut;
  late MockAccountRepository accountRepository;

  setUp(() {
    SharedPreferences.setMockInitialValues(
        {'sessionId': 'session_id', 'accountId': 1});
    accountRepository = MockAccountRepository();
    sut = AuthCubit(accountRepository);
  });
  group('authenticateUser', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.loginUser(any(), any()))
            .thenAnswer((_) async => 'session_id');
        when(() => accountRepository.getAccountDetails('session_id'))
            .thenAnswer((_) async =>
                AuthModel(sessionId: '1', requestToken: '1', accountId: 1));
      });

      blocTest<AuthCubit, AuthState>(
        'emits expected states during successful user authentication',
        build: () => sut,
        act: (cubit) async => await cubit.authenticateUser(
            username: 'username', password: 'password'),
        expect: () => [
          const AuthState(
              status: Status.loading, errorMessage: null, authModel: null),
          const AuthState(
            status: Status.authenticated,
            errorMessage: null,
            authModel: null,
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.loginUser(any(), any()))
            .thenAnswer((_) async => 'session_id');
        when(() => accountRepository.getAccountDetails('session_id'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<AuthCubit, AuthState>(
        'emits expected states during failure user authentication',
        build: () => sut,
        act: (cubit) async => await cubit.authenticateUser(
            username: 'username', password: 'password'),
        expect: () => [
          const AuthState(
              status: Status.loading, errorMessage: null, authModel: null),
          const AuthState(
            status: Status.unauthenticated,
            errorMessage: 'Exception: test-exception-error',
            authModel: null,
          ),
        ],
      );
    });
  });
  group('getSessionId', () {
    group('success', () {
      setUp(() {
        SharedPreferences.setMockInitialValues({
          'sessionId': 'session_id',
        });
      });
      blocTest<AuthCubit, AuthState>(
        'emits expected states when get session ID is successful',
        build: () => sut,
        act: (cubit) async => await cubit.getSessionId(),
        expect: () => [
          AuthState(
            status: Status.authenticated,
            errorMessage: null,
            authModel: AuthModel(
                sessionId: 'session_id', accountId: null, requestToken: null),
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        SharedPreferences.setMockInitialValues({'sessionId': ''});
      });

      blocTest<AuthCubit, AuthState>(
        'emits expected states when get session ID is failure',
        build: () => sut,
        act: (cubit) async => await cubit.getSessionId(),
        expect: () => [
          const AuthState(
              status: Status.unauthenticated,
              errorMessage: null,
              authModel: null),
        ],
      );
    });
  });
  group('deleteSession', () {
    group('success', () {
      setUp(() {
        when(() => accountRepository.deleteSession('session_id')).thenAnswer(
            (_) async => AuthModel(
                sessionId: null, requestToken: null, accountId: null));
      });
      blocTest<AuthCubit, AuthState>(
        'emits expected states when delete session is successful',
        build: () => sut,
        act: (cubit) async => await cubit.deleteSession(),
        expect: () => [
          const AuthState(
            status: Status.unauthenticated,
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => accountRepository.deleteSession('session_id'))
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<AuthCubit, AuthState>(
        'emits expected states when delete session is failure',
        build: () => sut,
        act: (cubit) async => await cubit.deleteSession(),
        expect: () => [
          const AuthState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
}
