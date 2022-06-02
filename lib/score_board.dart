import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard(
      {Key? key,
      required this.redBalls,
      required this.blueBalls,
      required this.greenBalls,
      required this.yellowBalls})
      : super(key: key);
  final int redBalls;
  final int blueBalls;
  final int greenBalls;
  final int yellowBalls;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -1),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                starIcon(Colors.red),
                Text(
                  '$redBalls',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                starIcon(Colors.blue),
                Text(
                  '$blueBalls',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                starIcon(Colors.green),
                Text(
                  '$greenBalls',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                starIcon(Colors.yellow),
                Text(
                  '$yellowBalls',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

starIcon(Color color) {
  return Icon(
    Icons.star,
    color: color,
    size: 30,
    shadows: [
      BoxShadow(
        color: color.withOpacity(0.6),
        blurRadius: 2,
        spreadRadius: 1,
      ),
    ],
  );
}
