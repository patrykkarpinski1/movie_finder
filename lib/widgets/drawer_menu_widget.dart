import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/auth/auth_page.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Colors.grey,
          ],
        ),
      ),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Text(
                  'M E N U',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              context.read<AuthCubit>().deleteSession();

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AuthPage(),
              ));
            },
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text(
              'LOGOUT',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back, color: Colors.white),
            onTap: () {
              Navigator.of(context).pop();
            },
            title: const Text(
              'CLOSE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
