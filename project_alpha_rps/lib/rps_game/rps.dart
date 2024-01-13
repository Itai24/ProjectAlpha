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

  Map<String, SpriteRPS> collisions = <String, SpriteRPS>{};

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
    if (other is SpriteRPS) {
      if (collisions.containsKey(other.hashCode.toString())) {
        // already handled the collision
      } else {
        collisions[other.hashCode.toString()] = other;

        speed.negate();
      }
    }
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

    // handles removing finished collisions
    List keys_of_finshed_collisions = [];
    for (var other in collisions.entries) {
      SpriteRPS otherObj = other.value;
      if (distance(otherObj) > size.x) {
        keys_of_finshed_collisions.add(other.key);
      }
    }

    collisions
        .removeWhere((key, value) => keys_of_finshed_collisions.contains(key));
    super.update(dt);

    // Update the position
    position.add(speed * dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
