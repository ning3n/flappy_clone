import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'screens/flappy_game.dart';

void main() {
  runApp(
    GestureDetector(
      onTap: () {
        game.jump();
      },
      child: GameWidget(game: game),
    )
  );
}

final game = FlappyGame();