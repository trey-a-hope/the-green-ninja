import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/enums/attack_type.dart';
import 'package:the_green_ninja/screens/game_over_screen.dart';

class GreenNinjaPlayer extends SimplePlayer
    with UseLifeBar, Lighting, BlockMovementCollision {
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
    setupLifeBar(
      showLifeText: false,
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
    );

    setupLighting(
      LightingConfig(
        radius: width * 2,
        blurBorder: width * 2,
        color: Colors.yellow.withValues(alpha: 0.1),
      ),
    );
  }

  @override
  Future<void> onLoad() {
    add(CircleHitbox(radius: 21.5));
    return super.onLoad();
  }

  @override
  void onReceiveDamage(AttackOriginEnum attacker, double damage, identify) {
    if (attacker == AttackOriginEnum.ENEMY) {
      FlameAudio.play(Globals.explosionSound);
      showDamage(
        damage,
        config: TextStyle(fontSize: width / 3, color: Colors.red),
      );
    }
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    FlameAudio.play(Globals.gameOverSound);
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    gameRef.pauseEngine();
    gameRef.overlays.add(GameOverScreen.id);
    super.onDie();
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN) {
      if (event.id == AttackType.melee ||
          event.id == LogicalKeyboardKey.space) {
        if (gameRef.player != null && gameRef.player?.isDead == true) return;
        simpleAttackMelee(
          withPush: false,
          damage: _damage * 2,
          size: size,
          animationRight: AnimationConfigs.cutAnimation(),
        );
      }

      if (event.id == AttackType.range ||
          event.id == LogicalKeyboardKey.enter) {
        if (gameRef.player != null && gameRef.player?.isDead == true) return;
        simpleAttackRange(
          damage: _damage,
          animationRight: AnimationConfigs.shurikenMagicAnimation(),
          size: size,
          collision: RectangleHitbox(size: size),
        );
      }
    }
    super.onJoystickAction(event);
  }
}
