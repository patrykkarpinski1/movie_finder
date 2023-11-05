import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_finder/app/core/config.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/auth/cubit/auth_cubit.dart';

Future main() async {
  Config.appFlavor = Flavor.development;
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(
    BlocProvider<AuthCubit>(
      create: (context) => getIt(),
      child: const MyApp(),
    ),
  );
}
