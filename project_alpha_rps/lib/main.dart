import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'rps_game/main_game.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(GameWidget(game: MainGame()));
}
