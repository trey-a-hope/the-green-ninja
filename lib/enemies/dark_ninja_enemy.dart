import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/collision_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/decorations/medipack.dart';

class DarkNinjaEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, UseBarLife {
  bool _seePlayerToAttackMelee = false;
  final double _damage = 10;

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
    if (!gameRef.sceneBuilderStatus.isRunning) {
      _seePlayerToAttackMelee = false;

      seeAndMoveToPlayer(
        closePlayer: (player) {
          if (gameRef.player != null && gameRef.player?.isDead == true) return;
          simpleAttackMelee(
            size: Vector2.all(size.y),
            damage: _damage,
            sizePush: Globals.defaultTileSize / 2,
            animationRight: AnimationConfigs.cutAnimation(),
          );
        },
        observed: () {
          _seePlayerToAttackMelee = true;
        },
        radiusVision: Globals.defaultTileSize * 2,
      );

      if (!_seePlayerToAttackMelee) {
        seeAndMoveToAttackRange(
          minDistanceFromPlayer: Globals.defaultTileSize * 4,
          positioned: (p) {
            if (gameRef.player != null && gameRef.player?.isDead == true)
              return;
            simpleAttackRange(
              animationRight: AnimationConfigs.shurikenAnimation(),
              animationDestroy: AnimationConfigs.smokeAnimation(),
              size: Vector2.all(width * 0.9),
              damage: _damage,
              speed: Globals.defaultTileSize * 3,
              collision:
                  CollisionConfigs.projectileCollisionConfig(width: width),
            );
          },
          radiusVision: Globals.radiusVision * 3,
          notObserved: () {
            runRandomMovement(
              dt,
              maxDistance: Globals.observeMaxDistance,
              minDistance: Globals.observeMinDistance,
            );
          },
        );
      }
    }
  }

  @override
  void die() {
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    bool dropPickup = Random().nextBool();
    if (dropPickup) {
      gameRef.add(Medipack(position: position));
    }
    super.die();
  }
}
