import 'package:flutter/material.dart';
import 'package:movie_finder/models/details/details_film_model.dart';

class DetailsFilmWidget extends StatelessWidget {
  const DetailsFilmWidget({
    Key? key,
    required this.filmModel,
  }) : super(key: key);

  final DetailsFilmModel filmModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              filmModel.title ?? 'download error',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: filmModel.genres.expand((genre) {
            return [
              if (filmModel.genres.indexOf(genre) != 0) ...[
                const Text(
                  '•',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
              TextButton(
                onPressed: () {},
                child: Text(
                  genre.name ?? 'download error',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ),
            ];
          }).toList(),
        ),
        Column(
          children: [
            SizedBox(
              child: filmModel.posterPath != null
                  ? FadeInImage(
                      placeholder: const AssetImage('images/load.png'),
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w500${filmModel.posterPath}'),
                      fit: BoxFit.cover,
                    )
                  : const Image(
                      image: AssetImage('images/film.png'),
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  filmModel.releaseDate ?? 'download error',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      filmModel.runtime.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const Text(
                      'm',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 36,
                  color: Color.fromARGB(198, 255, 153, 0),
                ),
                Text(
                  filmModel.voteCount.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.star_rate_sharp,
                  size: 36,
                  color: Color.fromARGB(198, 255, 153, 0),
                ),
                Text(
                  filmModel.voteAverage.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          filmModel.overview ?? 'download error',
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 30,
          textAlign: TextAlign.justify,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ]),
    );
  }
}
