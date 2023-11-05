import 'package:flutter/material.dart';
import 'package:movie_finder/app/core/config.dart';
import 'package:movie_finder/auth/auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Finder',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
      home: AuthPage(),
    );
  }
}
