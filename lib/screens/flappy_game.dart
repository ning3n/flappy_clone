import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlappyGame extends FlameGame{
  late double birdY;
  
  @override
  Future<void> onLoad() async{
    birdY = size.y / 2; //posicion inicial
  }

  @override
  void update(double dt){
    birdY += 200 * dt; //Simula caida por gravedad
  }

  @override
  void render(Canvas canvas){
    super.render(canvas);
    final paint = Paint()..color = Colors.yellow;
    canvas.drawRect(Rect.fromLTWH(size.x / 4, birdY, 30, 30), paint);
  }

  void jump(){
    birdY -= 50;
  }
}