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
      body: ListView(
        children: [
          const Image(
            fit: BoxFit.cover,
            image: AssetImage('images/welcome.jpg'),
          ),
          const Divider(
            color: Color.fromARGB(255, 9, 5, 36),
            thickness: 2.0,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 6, 6, 8),
                  Color.fromARGB(255, 2, 0, 24)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Enter your login information',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      fillColor: const Color.fromARGB(255, 40, 39, 39),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 117, 117, 117)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      fillColor: const Color.fromARGB(255, 40, 39, 39),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 117, 117, 117)),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      DialogHelper.showInfoDialog(
                          context,
                          'You will be redirected to an external page. Please follow the instructions and then return to the app to log in.',
                          'https://www.themoviedb.org/reset-password');
                    },
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 15, 4, 72),
                      ),
                      onPressed: () async {
                        await context.read<AuthCubit>().authenticateUser(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                      },
                      child: const Text('LOGIN'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ? "),
                      TextButton(
                        onPressed: () {
                          DialogHelper.showInfoDialog(
                              context,
                              'You will be redirected to www.themoviedb.org. Please create an account there, follow the instructions, and then return to the app to log in.',
                              'https://www.themoviedb.org/signup');
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
