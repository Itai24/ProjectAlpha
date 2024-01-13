// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import 'package:project_alpha_rps/rps_game/main_game.dart';
import 'package:project_alpha_rps/utils.dart';

import 'package:flame/components.dart';

//
// basic defenitions for the rps sprite
const String iconsNumber = '1';

enum RPS { rock, paper, scissors }

//
// A helper function for getting a random rps value
RPS getRandomRPS() {
  List<RPS> values = RPS.values;
  int randomIndex = Random().nextInt(values.length);

  return values[randomIndex];
}

//   ////////////////////////////////////////////////
//  //   The main sprite of our game, the "hand"  //
// ////////////////////////////////////////////////

class SpriteRPS extends SpriteComponent
    with HasGameRef<MainGame>, CollisionCallbacks {
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

    // Vector2 directionVec = Vector2(1, 1).normalized();
    speed = getRandomVector() * 300;
    anchor = Anchor.center;
    add(CircleHitbox(isSolid: true));

    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // if (other is ScreenHitbox) {
    //   if (intersectionPoints.every((element) => element.x == 0)) {
    //     if (speed.x < 0) {
    //       speed.x = -speed.x;
    //     }
    //   } else if (intersectionPoints
    //       .every((element) => element.x == gameRef.size.x)) {
    //     if (speed.x > 0) {
    //       speed.x = -speed.x;
    //     }
    //   } else if (intersectionPoints.every((element) => element.y == 0)) {
    //     if (speed.y < 0) {
    //       speed.y = -speed.y;
    //     }
    //   } else if (intersectionPoints
    //       .every((element) => element.y == gameRef.size.y)) {
    //     if (speed.y > 0) {
    //       speed.y = -speed.y;
    //     }
    //   } else {
    //     // edge case where it hits the corner
    //     //  (100% of the time it will work 99% of the time)
    //     speed.negate();
    //   }
    // }

    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    final rect = toRect();

    // checks if we past the left or right screen edge
    if ((rect.left <= 0 && speed.x < 0) ||
        (rect.right >= gameRef.size.x && speed.x > 0)) {
      speed.x *= -1;
    }

    // checks if we past the top or bottom screen edge
    if ((rect.top <= 0 && speed.y < 0) ||
        (rect.bottom >= gameRef.size.y && speed.y > 0)) {
      speed.y *= -1;
    }
    angle = atan2(speed.x, -speed.y);

    super.update(dt);

    // Update the position
    position.add(speed * dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
