import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/auth/auth_page.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';
import 'package:movie_finder/features/home/pages/favorite/favorite_page.dart';
import 'package:movie_finder/features/home/pages/watchlist/watchlist_page.dart';

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
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'M E N U',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          _buildMenuItem(
              icon: Icons.favorite_border,
              text: 'FAVORITE',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FavoritePage()));
              }),
          _buildMenuItem(
              icon: Icons.playlist_add,
              text: 'WATCHLIST',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const WatchlistPage()));
              }),
          _buildMenuItem(icon: Icons.star_border, text: 'RATED', onTap: () {}),
          _buildMenuItem(
              icon: Icons.logout,
              text: 'LOGOUT',
              onTap: () {
                context.read<AuthCubit>().deleteSession();

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AuthPage(),
                ));
              }),
          _buildMenuItem(
              icon: Icons.arrow_back,
              text: 'CLOSE',
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.black38,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  spreadRadius: 0.5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              leading: Icon(icon, color: Colors.white),
              title: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
