// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:project_alpha_rps/utils.dart';

import 'rps.dart';

class MainGame extends FlameGame with HasCollisionDetection, TapDetector {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(ScreenHitbox());
    add(DynamicTextComponent(this));
  }

  @override
  bool debugMode = true;

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
