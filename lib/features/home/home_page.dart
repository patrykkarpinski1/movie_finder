import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/injection_container.dart';
import 'package:movie_finder/features/home/cubit/home_cubit.dart';
import 'package:movie_finder/widgets/films/popular_movie_widget.dart';
import 'package:movie_finder/widgets/search_widget/cubit/search_cubit.dart';
import 'package:movie_finder/widgets/search_widget/search_widget.dart';
import 'package:movie_finder/widgets/films/top_rated_films_widget.dart';
import 'package:movie_finder/widgets/series/tv_series_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Offset> slideAnimation;
  bool isSearchVisible = false;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..value = 0.0;

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isSearchVisible = false;
        });
      }
    });

    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animationController);
  }

  void toggleSearch() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (animationController.status == AnimationStatus.dismissed) {
      setState(() {
        isSearchVisible = true;
      });
      animationController.forward();
      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => getIt<SearchCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage('images/video.png'),
              ),
              const Text(' MOVIE FINDER'),
              IconButton(
                  onPressed: toggleSearch, icon: const Icon(Icons.search))
            ],
          ),
        ),
        body: ListView(
          controller: scrollController,
          children: [
            SlideTransition(
              position: slideAnimation,
              child: isSearchVisible
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const SearchWidget(),
                    )
                  : const SizedBox.shrink(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              color: Colors.black,
              child: const Center(
                child: Text(
                  'POPULAR FILMS',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const PopularMovieWidget(),
            const TopRatedFilmsWidget(),
            const TvSeriesWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
