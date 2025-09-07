import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';

class Fire extends GameDecoration
    with Sensor<GreenNinjaPlayer>
    implements Lighting {
  final double _damage = 5;
  Fire({required Vector2 position})
      : super.withAnimation(
          animation: AnimationConfigs.fireAnimation(),
          position: position,
          size: Vector2.all(Globals.smallItemSize),
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 2,
        blurBorder: width * 2,
        color: Colors.yellow.withValues(alpha: 0.1),
      ),
    );
  }

  @override
  void onContact(GameComponent component) {
    component = component as GreenNinjaPlayer;
    FlameAudio.play(Globals.fireSound);
    component.showDamage(_damage);
    component.removeLife(_damage);
  }
}
