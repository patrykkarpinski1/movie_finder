import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/widgets/search_widget/cubit/search_cubit.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();

  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => onSearchChanged(context));
  }

  OverlayEntry createOverlayEntry(BuildContext context, List<Results> movies) {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        height: 200.0,
        child: Material(
          elevation: 4.0,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: ListTile(
                  leading: movies[index].posterPath != null
                      ? FadeInImage(
                          placeholder: const AssetImage('images/reload.png'),
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movies[index].posterPath}',
                          ),
                        )
                      : const Image(
                          image: AssetImage('images/film.png'),
                          fit: BoxFit.cover,
                        ),
                  title: Text(movies[index].name ?? 'download error'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Timer? searchDebouncer;

  onSearchChanged(BuildContext context) {
    if (searchDebouncer?.isActive ?? false) searchDebouncer?.cancel();
    searchDebouncer = Timer(const Duration(milliseconds: 300), () {
      context.read<SearchCubit>().search(query: controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          overlayEntry?.remove();
          overlayEntry = null;
        } else if (state.status == Status.success) {
          List<Results> combinedResults = [];
          if (state.films?.results != null) {
            combinedResults.addAll(state.films!.results!);
          }
          if (state.series?.results != null) {
            combinedResults.addAll(state.series!.results!);
          }
          List<Results> validResults =
              combinedResults.where((result) => result.name != null).toList();

          if (validResults.isNotEmpty) {
            overlayEntry?.remove();
            overlayEntry = createOverlayEntry(context, validResults);
            Overlay.of(context)?.insert(overlayEntry!);
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Builder(
              builder: (textFieldContext) => TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                ),
                onChanged: (text) {
                  onSearchChanged(textFieldContext);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    searchDebouncer?.cancel();
    controller.removeListener(() => onSearchChanged(context));
    controller.dispose();
    overlayEntry?.remove();
    super.dispose();
  }
}
