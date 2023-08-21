import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/details/cubit/details_cubit.dart';
import 'package:movie_finder/models/details/details_film_model.dart';
import 'package:movie_finder/widgets/details/details_film_widget.dart';

class DetailsFilmPage extends StatelessWidget {
  const DetailsFilmPage({required this.id, this.filmModel, super.key});
  final int id;
  final DetailsFilmModel? filmModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsCubit>(
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
            return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: BottomAppBar(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 36,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.playlist_add,
                          size: 36,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.star_border,
                          size: 36,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
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
                body: DetailsFilmWidget(filmModel: filmModel));
          } else {
            return Scaffold(
                appBar: AppBar(),
                body: const Center(
                    child: Text(
                  'Film details not available.',
                  style: TextStyle(fontSize: 24),
                )));
          }
        },
      ),
    );
  }
}
