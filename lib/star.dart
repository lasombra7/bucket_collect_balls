import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  Star(
      {Key? key,
      required this.color,
      required this.x,
      required this.y,
      required this.speed})
      : super(key: key);

  final Color color;
  final double x;
  final double y;
  final double speed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Icon(
        Icons.star,
        color: color,
        size: 40,
        shadows: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
