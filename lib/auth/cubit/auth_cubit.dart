import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/account/user_model.dart';
import 'package:movie_finder/repositories/account_repositories.dart';
import 'package:url_launcher/url_launcher.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.accountRepository) : super(const AuthState());
  final AccountRepository accountRepository;

  Future<void> authenticateUser() async {
    try {
      emit(const AuthState(status: Status.loading));

      final requestToken = await accountRepository.generateRequestToken();

      if (requestToken == null || requestToken.requestToken == null) {
        emit(const AuthState(
            errorMessage: 'The request token could not be obtained.'));
        return;
      }

      final url =
          'https://www.themoviedb.org/authenticate/${requestToken.requestToken}';

      launchUrl(Uri.parse(url));

      await Future.delayed(const Duration(minutes: 5));

      final userModel =
          await accountRepository.createSessionId(requestToken.requestToken!);

      if (userModel == null || userModel.sessionId == null) {
        emit(const AuthState(
            errorMessage: 'The session identifier could not be obtained.'));
        return;
      }

      emit(AuthState(userModel: userModel, status: Status.success));
    } catch (error) {
      emit(AuthState(errorMessage: error.toString(), status: Status.error));
    }
  }
}
