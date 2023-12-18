// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

const String iconsNumber = '1';

class MainGamePage extends StatelessWidget {
  const MainGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget(game: MainGame()),
      ),
    );
  }
}

class Square extends PositionComponent {
// default values

// velocity is 0 here
  var velocity = Vector2(0, 0).normalized() * 25;
// large square
  var squareSize = 128.0;
// colored white with no-fill and an outline strike
  var color = BasicPalette.white.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
// Inftialize the component
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(squareSize, squareSize);
    anchor = Anchor.center;
  }

// update the inner state of the shape
// in our case the position based on velocity
  @override
  void update(double dt) {
    super.update(dt);
// speed is refresh frequency independent
    position += velocity * dt;
  }

  @override
  // render the shape
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), color);
  }
}

enum RPS { rock, paper, scissors }

RPS getRandomRPS(){
  List<RPS> values = RPS.values;
  int randomIndex = Random().nextInt(values.length);

  return values[randomIndex];
}

class SpriteRPS extends SpriteComponent {
  RPS _type = RPS.rock;
  Vector2 speed = Vector2(0, 0);

  SpriteRPS(RPS type) {
    _type = type;
  }

  @override
  FutureOr<void> onLoad() async {
    switch (_type) {
      case RPS.rock:
        sprite = await Sprite.load('game-icons/${iconsNumber}rock.png');
        break;
      case RPS.paper:
        sprite = await Sprite.load('game-icons/${iconsNumber}paper.png');
        break;
      case RPS.scissors:
        sprite = await Sprite.load('game-icons/${iconsNumber}scissors.png');
        break;

      default:
    }

    size = Vector2(50, 50);

    speed = Vector2(0, -1).normalized() * 100;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the position
    position.add(speed * dt);
  }
}


class MainGame extends FlameGame with TapDetector {

  @override
  FutureOr<void> onLoad() async {
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTapUp(TapUpInfo info) {
    final touchPoint = info.eventPosition.global;


    add(SpriteRPS(getRandomRPS())..position = touchPoint);
  }
}
