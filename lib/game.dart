import 'dart:async';
import 'dart:math';

import 'package:hit_the_stars/player.dart';
import 'package:hit_the_stars/score_board.dart';
import 'package:hit_the_stars/star.dart';
import 'package:hit_the_stars/start_button.dart';
import 'package:flutter/material.dart';

import 'background.dart';
import 'game_label.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  State<MyGame> createState() => _MyGameState();
}

const List<Color> starColors = [
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.black,
];

enum GameStatus {
  notStarted,
  playing,
  success,
  over,
}

class _MyGameState extends State<MyGame> {
  GameStatus gameStatus = GameStatus.notStarted;
  Timer? _timer;
  Timer? _timer2;

  late Size screenSize;
  List<Star> stars = [];
  int redBalls = 30;
  int blueBalls = 30;
  int greenBalls = 30;
  int yellowBalls = 30;

  double playerX = 0;
  startGame() {
    gameLoop();
    gameStatus = GameStatus.playing;
    setState(() {});
  }

  gameLoop() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (Timer timer) {
      //循环调整星星位置
      for (var i = 0; i < stars.length; i++) {
        Star self = stars[i];
        stars[i] = Star(
          color: self.color,
          x: self.x,
          y: self.y + self.speed,
          speed: self.speed,
        );
      }
      checkCollision();
      //删除超出屏幕的星星
      stars.removeWhere((star) => star.y > screenSize.height);
      setState(() {});
    });

    //每隔一段时间创建一个星星
    _timer2 = Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      if (redBalls == 0 &&
          blueBalls == 0 &&
          greenBalls == 0 &&
          yellowBalls == 0) {
        gameSuccess();
        return;
      }

      setState(() {
        stars.add(starGenerator());
      });
    });
  }

  starGenerator() {
    var star = Star(
      key: UniqueKey(),
      x: Random().nextDouble() * screenSize.width,
      y: 0,
      color: starColors[Random().nextInt(starColors.length)],
      speed: Random().nextDouble() * 10,
    );
    return star;
  }

  //碰撞检测 如果碰到飞机 则加分
  checkCollision() {
    for (var i = 0; i < stars.length; i++) {
      Star self = stars[i];
      if (self.y < screenSize.height - 40 - 130) {
        continue;
      }
      if (self.color == Colors.red) {
        if (playerX > self.x - 50 && playerX < self.x + 50) {
          redBalls--;
          stars.removeAt(i);
          setState(() {});
        }
      } else if (self.color == Colors.blue) {
        if (playerX > self.x - 50 && playerX < self.x + 50) {
          blueBalls--;
          stars.removeAt(i);
          setState(() {});
        }
      } else if (self.color == Colors.green) {
        if (playerX > self.x - 50 && playerX < self.x + 50) {
          greenBalls--;
          stars.removeAt(i);
          setState(() {});
        }
      } else if (self.color == Colors.yellow) {
        if (playerX > self.x - 50 && playerX < self.x + 50) {
          yellowBalls--;
          stars.removeAt(i);
          setState(() {});
        }
      } else if (self.color == Colors.black) {
        if (playerX > self.x - 50 && playerX < self.x + 50) {
          gameOver();
        }
      }
    }
  }

  //游戏结束
  gameOver() {
    gameStatus = GameStatus.over;
    _timer?.cancel();
    _timer2?.cancel();
    setState(() {});
  }

  //闯关成功
  gameSuccess() {
    gameStatus = GameStatus.success;
    _timer?.cancel();
    _timer2?.cancel();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = MediaQuery.of(context).size;
    playerX = screenSize.width / 2 - 50;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Material(
      child: GestureDetector(
        onTap: () {
          if (gameStatus == GameStatus.notStarted ||
              gameStatus == GameStatus.over) {
            startGame();
          }
        },
        onPanUpdate: (details) {
          if (gameStatus == GameStatus.playing) {
            setState(() {
              playerX += details.delta.dx;
            });
          }
        },
        child: Stack(
          children: [
            const Background(),
            ...stars,
            Player(x: playerX),
            GameLabel(
              gameStatus: gameStatus,
            ),
            StartButton(
              gameStatus: gameStatus,
            ),
            ScoreBoard(
              redBalls: redBalls,
              blueBalls: blueBalls,
              greenBalls: greenBalls,
              yellowBalls: yellowBalls,
            ),
          ],
        ),
      ),
    );
  }
}
