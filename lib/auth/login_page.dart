import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';
import 'package:movie_finder/widgets/auth/dialog_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              image: AssetImage('images/video.png'),
            ),
            Text(' MOVIE FINDER'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await context.read<AuthCubit>().authenticateUser(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                DialogHelper.showInfoDialog(
                    context,
                    'You will be redirected to www.themoviedb.org. Please create an account there, follow the instructions, and then return to the app to log in.',
                    'https://www.themoviedb.org/signup');
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () {
                DialogHelper.showInfoDialog(
                    context,
                    'You will be redirected to an external page. Please follow the instructions and then return to the app to log in.',
                    'https://www.themoviedb.org/reset-password');
              },
              child: const Text('Forgot your password?'),
            ),
          ],
        ),
      ),
    );
  }
}
