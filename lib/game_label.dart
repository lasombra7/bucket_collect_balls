import 'package:flutter/material.dart';

import 'game.dart';

class GameLabel extends StatelessWidget {
  const GameLabel({Key? key, required this.gameStatus}) : super(key: key);
  final GameStatus gameStatus;
  @override
  Widget build(BuildContext context) {
    String label = '';

    switch (gameStatus) {
      case GameStatus.notStarted:
        label = 'Hit the Stars';

        break;

      case GameStatus.playing:
        label = '';
        break;
      case GameStatus.success:
        label = 'Success';

        break;
      case GameStatus.over:
        label = 'Game Over';
        break;
      default:
        label = '';
    }
    return Align(
      alignment: Alignment(0, -0.1),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 90,
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
