import 'package:flutter/material.dart';

class Obstacle extends StatelessWidget {
  final double obstacleX; //posicion horizontal del tubo
  final double height; //altura del tubo
  final bool isTop; //si es el tubo superior
  const Obstacle({super.key, required this.obstacleX, required this.height, required this.isTop});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(obstacleX, isTop ? -1.1 : 1.1),
      child: Container(
        width: 60,
        height: height,
        color: Colors.green,
      ),
    );
  }
}