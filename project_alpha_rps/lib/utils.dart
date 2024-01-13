// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

//
// returns a random vector
Vector2 getRandomVector() {
  final random = Random();
  final angle = random.nextDouble() * 2 * pi; // Random angle in radians
  return Vector2(cos(angle), sin(angle)); // Create the unit vector
}

class DynamicTextComponent extends TextComponent {
  final FlameGame game;

  DynamicTextComponent(this.game)
      : super(
          text: '',
          position: Vector2(100, game.size.y - 50), // Set initial position
          // Additional text styling options here
        );

  @override
  void update(double dt) {
    super.update(dt);
    text = 'hands: ${game.children.length - 4}';
  }
}
