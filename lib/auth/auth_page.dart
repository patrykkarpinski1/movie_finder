import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';
import 'package:movie_finder/features/home/home_page.dart';
import 'package:movie_finder/widgets/auth/login_widget.dart';

class AuthPage extends StatelessWidget {
  AuthPage({
    Key? key,
  }) : super(key: key);

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AuthCubit>().getSessionId(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status == Status.error) {
                final errorMessage = state.errorMessage ?? 'Unknown error';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (state.status == Status.success) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              }
            },
            builder: (context, state) {
              if (state.status == Status.authenticated) {
                return const HomePage();
              } else if (state.status == Status.unauthenticated ||
                  state.status == Status.error) {
                return LoginWidget(
                    usernameController: usernameController,
                    passwordController: passwordController);
              } else {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
