import 'package:flutter/material.dart';

class TvSeriesWidget extends StatelessWidget {
  const TvSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('TV Series',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Top Rated'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Popular'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
