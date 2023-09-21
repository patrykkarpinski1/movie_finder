import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget(
      {super.key,
      required this.onRatingSubmitted,
      required this.onRatingCanceled});
  final Function(double) onRatingSubmitted;
  final void Function() onRatingCanceled;

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double _currentRating = 1.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove,
            color: Colors.black,
          ),
          onPressed: widget.onRatingCanceled,
        ),
        Slider(
          value: _currentRating,
          onChanged: (newRating) {
            setState(() {
              _currentRating = newRating;
            });
          },
          divisions: 9,
          min: 1.0,
          max: 10.0,
          label: _currentRating.toStringAsFixed(1),
        ),
        IconButton(
          icon: const Icon(
            Icons.check,
            color: Colors.black,
          ),
          onPressed: () {
            widget.onRatingSubmitted(_currentRating);
          },
        ),
      ],
    );
  }
}
