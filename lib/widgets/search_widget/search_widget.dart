import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/models/search/search_model.dart';
import 'package:movie_finder/widgets/search_widget/cubit/search_cubit.dart';
import 'package:movie_finder/widgets/search_widget/overlay_entry.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with WidgetsBindingObserver {
  final TextEditingController controller = TextEditingController();
  OverlayEntry? overlayEntry;
  bool isOverlayVisible = false;

  Timer? searchDebouncer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller.addListener(() => onSearchChanged(context));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && isOverlayVisible) {
      hideOverlay();
    }
  }

  void hideOverlay() {
    if (isOverlayVisible && overlayEntry != null && overlayEntry!.mounted) {
      overlayEntry?.remove();
      isOverlayVisible = false;
    }
  }

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
          hideOverlay();
        } else if (state.status == Status.success) {
          List<Results> combinedResults = [];
          if (state.films?.results != null) {
            combinedResults.addAll(state.films!.results!);
          }
          if (state.series?.results != null) {
            combinedResults.addAll(state.series!.results!);
          }
          List<Results> validResults = combinedResults
              .where((result) => result.name != null || result.title != null)
              .toList();

          if (validResults.isNotEmpty) {
            hideOverlay();
            overlayEntry = createOverlayEntry(
                context, validResults, overlayEntry, controller);
            Overlay.of(context).insert(overlayEntry!);
            isOverlayVisible = true;
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
    WidgetsBinding.instance.removeObserver(this);
    searchDebouncer?.cancel();
    controller.removeListener(() => onSearchChanged(context));
    controller.dispose();
    hideOverlay();
    super.dispose();
  }
}
