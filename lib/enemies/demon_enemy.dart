import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/decorations/medipack.dart';

class DemonEnemy extends SimpleEnemy with RandomMovement, UseLifeBar {
  bool _seePlayerToAttackMelee = false;
  final double _damage = 10;

  DemonEnemy({required Vector2 position})
      : super(
          position: position,
          size: Vector2(Globals.playerSize, Globals.playerSize),
          speed: 150,
          life: 50,
          initDirection: Direction.down,
          animation: AnimationConfigs.demonCyclopAnimation(),
        ) {
    setupLifeBar(
      showLifeText: false,
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
    );
  }

  @override
  Future<void> onLoad() {
    add(CircleHitbox(radius: size.length));
    return super.onLoad();
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify) {
    FlameAudio.play(Globals.explosionSound);
    showDamage(
      damage,
      config: TextStyle(fontSize: width / 3, color: Colors.red),
    );
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    gameRef.camera.shake(intensity: 4);
    removeFromParent();

    bool dropPickup = Random().nextBool();
    if (dropPickup) {
      gameRef.add(Medipack(position: position));
    }
    super.onDie();
  }

  @override
  void update(double dt) {
    if (!gameRef.sceneBuilderStatus.isRunning) {
      _seePlayerToAttackMelee = false;

      seeAndMoveToPlayer(
        closePlayer: (player) {
          if (!player.isDead) {
            simpleAttackMelee(
              withPush: false,
              damage: _damage * 2,
              size: size,
              animationRight: AnimationConfigs.cutAnimation(),
            );
          }
        },
        radiusVision: Globals.radiusVision,
        observed: () {
          _seePlayerToAttackMelee = true;
        },
      );

      if (!_seePlayerToAttackMelee) {
        seeAndMoveToAttackRange(
          minDistanceFromPlayer: Globals.defaultTileSize * 4,
          positioned: (player) {
            if (!player.isDead) {
              simpleAttackRange(
                damage: _damage,
                animation: AnimationConfigs.fireBallAnimation(),
                animationDestroy: AnimationConfigs.smokeAnimation(),
                size: size,
                collision: RectangleHitbox(size: size),
              );
            }
          },
          radiusVision: Globals.radiusVision * 2,
          notObserved: () {
            runRandomMovement(
              dt,
              maxDistance: Globals.observeMaxDistance,
              minDistance: Globals.observeMinDistance,
            );

            return _seePlayerToAttackMelee;
          },
        );
      }
    }

    super.update(dt);
  }
}
