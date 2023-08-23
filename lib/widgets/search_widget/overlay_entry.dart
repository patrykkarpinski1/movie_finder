import 'package:flutter/material.dart';
import 'package:movie_finder/app/core/enums.dart';
import 'package:movie_finder/features/details/details_film_page.dart';
import 'package:movie_finder/features/details/details_series_page.dart';
import 'package:movie_finder/models/search/search_model.dart';

OverlayEntry createOverlayEntry(BuildContext context, List<Results> results,
    OverlayEntry? overlayEntry, TextEditingController controller) {
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
          itemCount: results.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (overlayEntry != null && overlayEntry.mounted) {
                  overlayEntry.remove();
                }
                controller.clear();
                if (results[index].type == MediaType.movie) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailsFilmPage(id: results[index].id),
                  ));
                } else if (results[index].type == MediaType.series) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailsSeriesPage(id: results[index].id),
                  ));
                }
              },
              child: ListTile(
                leading: results[index].posterPath != null
                    ? FadeInImage(
                        placeholder: const AssetImage('images/reload.png'),
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${results[index].posterPath}',
                        ),
                      )
                    : const Image(
                        image: AssetImage('images/film.png'),
                        fit: BoxFit.cover,
                      ),
                title: Text(results[index].name ??
                    results[index].title ??
                    'download error'),
              ),
            );
          },
        ),
      ),
    ),
  );
}
