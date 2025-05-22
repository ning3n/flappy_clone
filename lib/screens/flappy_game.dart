import 'dart:async';
import 'dart:math';

import 'package:flappy_clone/Widgets/bird.dart';
import 'package:flutter/material.dart';
import 'package:flappy_clone/Widgets/obstacle.dart';

class FlappyGame extends StatefulWidget {
  const FlappyGame({super.key});

  @override
  State<FlappyGame> createState() => _FlappyGameState();
}

class _FlappyGameState extends State<FlappyGame> {
  //Variables
  double birdY = 0;
  double time = 0;
  double initialPos = 0;
  double gravity = -4.9;
  double velocity = 3.5;
  bool gameHasStarted = false;
  double obstacleX = 1.5;
  double obstacleHeight = 200;

  //Timer
  Timer? gameTimer;

    void startGame(){
      gameHasStarted = true;
      time = 0;
      initialPos = birdY;

      gameTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        time += 0.05;
        double height = gravity * time * time + velocity * time;

        setState(() {
          birdY = initialPos - height;
        });

        if (birdY > 1.1 || birdY < -1.1) {
          _resetGame();
        }
      });
      obstacleX -= 0.02;
      
      if(obstacleX < -1.5){
        obstacleX = 1.5;
        obstacleHeight = 150 + Random().nextInt(100).toDouble();
      }

      if ((obstacleX < 0.2 && obstacleX > -0.2) && (birdY < -0.7 || birdY > 0.7)){
        _resetGame();
      }
    }

    void jump(){
      setState(() {
        time = 0;
        initialPos = birdY;
      });
    }

    void _resetGame(){
      gameTimer?.cancel();
      setState(() {
        birdY = 0;
        gameHasStarted = false;
        time = 0;
        initialPos = 0;
      });
    }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (gameHasStarted) {
          jump();
        }else{
          startGame();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment(0, birdY),
                child: const Bird(),
              ),
              Obstacle(
                obstacleX: obstacleX, 
                height: obstacleHeight, 
                isTop: true,
              ),
              Obstacle(
                obstacleX: obstacleX, 
                height: 300, 
                isTop: false,
              ),
              if (!gameHasStarted)
                const Center(
                  child: Text("TOCA PARA JUGAR", style: TextStyle(fontSize: 24, color: Colors.white)),
                )
            ],
          ),
        ),
      ),
    );
  }
}