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

  late Sprite rockSprite;
  late Sprite paperSprite;
  late Sprite scissorsSprite;

  Map<String, SpriteRPS> collisions = <String, SpriteRPS>{};

  SpriteRPS(RPS type) {
    _type = type;
  }

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(50, 50);

    // Vector2 directionVec = Vector2(1, 1).normalized();
    speed = getRandomVector() * 300;
    anchor = Anchor.center;
    add(CircleHitbox(isSolid: true));

    // loading sprites to cache
    rockSprite = await Sprite.load('game-icons/${iconsNumber}rock.png');
    paperSprite = await Sprite.load('game-icons/${iconsNumber}paper.png');
    scissorsSprite = await Sprite.load('game-icons/${iconsNumber}scissors.png');
    sprite = rockSprite;

    // adding to hand counters
    gameRef.totalCntr++;
    addRPSToCntr(_type);

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

        // handle switching teams logic
        if (isLosing(other._type)) {
          
          removeRPSToCntr(_type);
          addRPSToCntr(other._type);
          _type = other._type;
        }
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

    // Update the position
    position.add(speed * dt);

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    switch (_type) {
      case RPS.rock:
        sprite = rockSprite;
        break;
      case RPS.paper:
        sprite = paperSprite;
        break;
      case RPS.scissors:
        sprite = scissorsSprite;
        break;

      default:
    }
    super.render(canvas);
  }

  void addRPSToCntr(RPS type) {
    switch (type) {
      case RPS.rock:
        gameRef.rockCntr += 1;
        break;
      case RPS.paper:
        gameRef.paperCntr += 1;
        break;
      case RPS.scissors:
        gameRef.scissorsCntr += 1;
        break;

      default:
    }
  }

  void removeRPSToCntr(RPS type) {
    switch (type) {
      case RPS.rock:
        gameRef.rockCntr -= 1;
        break;
      case RPS.paper:
        gameRef.paperCntr -= 1;
        break;
      case RPS.scissors:
        gameRef.scissorsCntr -= 1;
        break;

      default:
    }
  }

  bool isLosing(typeToBeat) {
    if (_type == typeToBeat) {
      return false;
    }
    // if you're rock
    if (_type == RPS.rock && typeToBeat == RPS.paper) {
      return true;
    }
    if (_type == RPS.rock && typeToBeat == RPS.scissors) {
      return false;
    }
    // if you're paper
    if (_type == RPS.paper && typeToBeat == RPS.scissors) {
      return true;
    }
    if (_type == RPS.paper && typeToBeat == RPS.rock) {
      return false;
    }
    // if you're scissors
    if (_type == RPS.scissors && typeToBeat == RPS.rock) {
      return true;
    }
    if (_type == RPS.scissors && typeToBeat == RPS.paper) {
      return false;
    }
    throw Exception();
  }
}
