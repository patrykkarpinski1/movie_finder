import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/details/cubit/details_cubit.dart';
import 'package:movie_finder/models/details/details_film_model.dart';

class DetailsFilmPage extends StatelessWidget {
  const DetailsFilmPage({required this.id, this.filmModel, super.key});
  final int id;
  final DetailsFilmModel? filmModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Image(
          image: AssetImage('images/video.png'),
        ),
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('MOVIE FINDER'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded))
        ],
      ),
      body: BlocProvider<DetailsCubit>(
        create: (context) => getIt()..getDetailsFilm(id),
        child: BlocConsumer<DetailsCubit, DetailsState>(
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
            if (state.status == Status.initial) {
              return const Center(
                child: Text('Initial state'),
              );
            }
            if (state.status == Status.loading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.status == Status.success) {
              if (state.film == null) {
                return const SizedBox.shrink();
              }
            }
            if (state.film != null) {
              final filmModel = state.film!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(children: [
                  Text(
                    filmModel.originalTitle ?? '',
                    style: const TextStyle(color: Colors.black),
                  ),
                ]),
              );
            } else {
              return const Center(child: Text('Film details not available.'));
            }
          },
        ),
      ),
    );
  }
}
