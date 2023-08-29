import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';
import 'package:movie_finder/features/home/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt()..authenticateUser(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              final errorMessage = state.errorMessage ?? 'Unknown error';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.success:
                return const HomePage();
              case Status.error:
                return const Center(
                  child: Text('The authorisation token could not be obtained.'),
                );
              default:
                return const Center(
                  child: Text('Unknown error.'),
                );
            }
          },
        ),
      ),
    );
  }
}
