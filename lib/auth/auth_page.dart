import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';
import 'package:movie_finder/features/home/home_page.dart';
import 'package:movie_finder/auth/login_page.dart';

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
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage ?? 'Unknown error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                switch (state.status) {
                  case Status.authenticated:
                    return const HomePage();
                  case Status.loading:
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  case Status.unauthenticated:
                  default:
                    return LoginPage(
                      usernameController: usernameController,
                      passwordController: passwordController,
                    );
                }
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
