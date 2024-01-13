// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:project_alpha_rps/rps_game/main_game.dart';
import 'package:project_alpha_rps/rps_game/rps.dart';

//
// returns a random vector
Vector2 getRandomVector() {
  final random = Random();
  final angle = random.nextDouble() * 2 * pi; // Random angle in radians
  return Vector2(cos(angle), sin(angle)); // Create the unit vector
}

class DynamicTextComponent extends TextComponent {
  final MainGame game;

  DynamicTextComponent(this.game)
      : super(
          text: '',
          position: Vector2(50, game.size.y - 50), // Set initial position
          // Additional text styling options here
        );

  @override
  void update(double dt) {
    super.update(dt);
    text =
        'rocks: ${game.rockCntr}, papers: ${game.paperCntr}, scissors: ${game.scissorsCntr}';
  }
}
