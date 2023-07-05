import 'dart:math' as math;

import 'package:flutter/material.dart';

class RatingCircleWidget extends StatelessWidget {
  final double rating;

  const RatingCircleWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      height: 50.0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 14, 7),
              shape: BoxShape.circle,
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: RatingCirclePainter(rating / 10.0),
            ),
          ),
          Center(
            child: Text(
              rating.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingCirclePainter extends CustomPainter {
  final Paint trackPaint;
  final Paint completePaint;
  final double percent;

  RatingCirclePainter(this.percent)
      : trackPaint = Paint()
          ..color = Colors.transparent
          ..strokeWidth = 7.0
          ..style = PaintingStyle.stroke,
        completePaint = Paint()
          ..color = Colors.green
          ..strokeWidth = 7.0
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final outerCircle = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: math.min(size.width / 2, size.height / 2),
    );

    canvas.drawArc(
      outerCircle,
      -math.pi / 2,
      2 * math.pi,
      false,
      trackPaint,
    );

    canvas.drawArc(
      outerCircle,
      -math.pi / 2,
      2 * math.pi * percent,
      false,
      completePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
