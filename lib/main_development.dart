import 'package:flutter/material.dart';
import 'package:movie_finder/app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_finder/app/injection_container.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(const MyApp());
}
