import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final double x;

  const Player({Key? key, required this.x}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        left: x,
        child: Container(
            width: 100,
            height: 80,
            child: Image.asset(
              'assets/images/plane_0_titi_son.png',
              fit: BoxFit.fill,
            )));
  }
}
