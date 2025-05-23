import 'package:flutter/material.dart';

class Obstacle extends StatelessWidget {
  final double obstacleX;
  final double height;
  final bool isTop;

  const Obstacle({
    super.key,
    required this.obstacleX,
    required this.height,
    required this.isTop,
  });

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