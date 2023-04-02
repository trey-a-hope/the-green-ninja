import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';

class Fire extends GameDecoration with Lighting, Sensor<GreenNinjaPlayer> {
  final double _damage = 5;

  Fire({required Vector2 position})
      : super.withAnimation(
          animation: AnimationConfigs.fireAnimation(),
          size: Vector2.all(Globals.itemSize),
          position: position,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 2,
        blurBorder: width * 2,
        color: Colors.yellow.withOpacity(0.1),
      ),
    );
  }

  @override
  void onContact(GameComponent component) {
    if (component is GreenNinjaPlayer) {
      FlameAudio.play(Globals.fireSound);
      component.showDamage(_damage);
      component.removeLife(_damage);
    }
  }

  @override
  void onContactExit(GameComponent component) {}
}
