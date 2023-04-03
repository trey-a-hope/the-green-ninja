import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/collision_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/enums/attack_type.dart';
import 'package:the_green_ninja/screens/game_over_screen.dart';

class GreenNinjaPlayer extends SimplePlayer
    with ObjectCollision, UseBarLife, Lighting {
  final double _damage = 10;

  GreenNinjaPlayer(
      {required Vector2 position, required SpriteSheet spriteSheet})
      : super(
          position: position,
          size: Vector2(Globals.playerSize, Globals.playerSize),
          speed: 200,
          life: 100,
          initDirection: Direction.down,
          animation:
              AnimationConfigs.greenNinjaAnimation(spriteSheet: spriteSheet),
        ) {
    setupBarLife(
      showLifeText: false,
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
    );

    setupLighting(
      LightingConfig(
        radius: width * 2,
        blurBorder: width * 2,
        color: Colors.yellow.withOpacity(0.1),
      ),
    );

    setupCollision(
      CollisionConfigs.playerCollisionConfig(),
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (attacker == AttackFromEnum.ENEMY) {
      FlameAudio.play(Globals.explosionSound);
      showDamage(
        damage,
        config: TextStyle(fontSize: width / 3, color: Colors.red),
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() {
    FlameAudio.play(Globals.gameOverSound);
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    gameRef.pauseEngine();
    gameRef.overlayManager.add(GameOverScreen.id);
    super.die();
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN) {
      if (event.id == AttackType.melee ||
          event.id == LogicalKeyboardKey.numpad0.keyId) {
        if (gameRef.player != null && gameRef.player?.isDead == true) return;
        simpleAttackMelee(
          withPush: false,
          damage: _damage * 2,
          size: size,
          animationRight: AnimationConfigs.cutAnimation(),
        );
      }

      if (event.id == AttackType.range ||
          event.id == LogicalKeyboardKey.numpadEnter.keyId) {
        if (gameRef.player != null && gameRef.player?.isDead == true) return;
        simpleAttackRange(
          damage: _damage,
          animationRight: AnimationConfigs.shurikenMagicAnimation(),
          animationLeft: AnimationConfigs.shurikenMagicAnimation(),
          animationUp: AnimationConfigs.shurikenMagicAnimation(),
          animationDown: AnimationConfigs.shurikenMagicAnimation(),
          size: size,
          collision: CollisionConfigs.projectileCollisionConfig(
            width: width,
          ),
        );
      }
    }

    super.joystickAction(event);
  }
}
