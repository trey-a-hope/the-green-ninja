import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/collision_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';

class DarkNinjaEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, UseBarLife {
  DarkNinjaEnemy({
    required Vector2 position,
    required SpriteSheet spriteSheet,
  }) : super(
          animation: AnimationConfigs.darkNinjaAnimation(
            spriteSheet: spriteSheet,
          ),
          size: Vector2.all(Globals.playerSize),
          position: position,
          initDirection: Direction.down,
          speed: Globals.playerSize,
          life: 100,
        ) {
    setupBarLife(
      showLifeText: false,
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
    );

    setupCollision(
      CollisionConfigs.playerCollisionConfig(),
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    FlameAudio.play(Globals.explosionSound);
    showDamage(
      damage,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.red,
      ),
    );
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void update(double dt) {
    super.update(dt);
    seeAndMoveToPlayer(
      closePlayer: (player) {},
      radiusVision: Globals.radiusVision,
      observed: () {},
      notObserved: () {
        runRandomMovement(
          dt,
          maxDistance: Globals.observeMaxDistance,
          minDistance: Globals.observeMinDistance,
        );
      },
    );
  }

  @override
  void die() {
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    super.die();
  }
}
