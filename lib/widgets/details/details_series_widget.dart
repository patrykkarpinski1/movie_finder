import 'package:flutter/material.dart';
import 'package:movie_finder/models/details/details_series_model.dart';
import 'package:movie_finder/widgets/details/season_widget.dart';

class DetailsSeriesWidget extends StatelessWidget {
  const DetailsSeriesWidget({
    Key? key,
    required this.seriesModel,
  }) : super(key: key);

  final DetailsSeriesModel seriesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Text(
                seriesModel.name ?? 'download error',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                child: seriesModel.posterPath != null
                    ? FadeInImage(
                        placeholder: const AssetImage('images/load.png'),
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/w500${seriesModel.posterPath}'),
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
                    seriesModel.firstAirDate ?? 'download error',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    ' - ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    seriesModel.lastAirDate ?? 'download error',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
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
                    seriesModel.voteCount.toString(),
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
                    seriesModel.voteAverage.toString(),
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
            seriesModel.overview ?? 'download error',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 30,
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          SeasonWidget(
            season: seriesModel.seasons,
          )
        ],
      ),
    );
  }
}
