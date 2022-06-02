import 'package:flutter/material.dart';

import 'game.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, required this.gameStatus}) : super(key: key);
  final GameStatus gameStatus;
  @override
  Widget build(BuildContext context) {
    String label = '';

    switch (gameStatus) {
      case GameStatus.notStarted:
        label = 'Start Game';

        break;

      case GameStatus.playing:
        label = '';
        break;
      case GameStatus.success:
        label = 'Success';

        break;
      case GameStatus.over:
        label = 'Tap To Restart';
        break;
      default:
        label = '';
    }

    return Align(
      alignment: const Alignment(0, 0.3),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
