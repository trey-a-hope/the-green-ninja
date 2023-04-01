import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/collision_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/enums/attack_type.dart';

class GreenNinjaPlayer extends SimplePlayer {
  final double _damage = 10;

  GreenNinjaPlayer({
    required Vector2 position,
    required SpriteSheet spriteSheet,
  }) : super(
          animation: AnimationConfigs.greenNinjaAnimation(
            spriteSheet: spriteSheet,
          ),
          size: Vector2.all(Globals.playerSize),
          position: position,
          initDirection: Direction.down,
          speed: Globals.playerSize * 3,
          life: 100,
        );

  @override
  void joystickAction(JoystickActionEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning) {
      return;
    }

    if (event.event == ActionEvent.DOWN) {
      if (event.id == LogicalKeyboardKey.numpad0.keyId ||
          event.id == AttackType.range) {
        if (gameRef.player != null && gameRef.player?.isDead == true) return;

        simpleAttackRange(
          animationDown: AnimationConfigs.shurikenMagicAnimation,
          animationUp: AnimationConfigs.shurikenMagicAnimation,
          animationLeft: AnimationConfigs.shurikenMagicAnimation,
          animationRight: AnimationConfigs.shurikenMagicAnimation,
          animationDestroy: AnimationConfigs.shurikenMagicAnimation,
          size: Vector2.all(width),
          damage: _damage,
          speed: Globals.defaultTileSize * 3,
          collision: CollisionConfigs.projectileCollisionConfig(width: width),
        );
      }

      if (event.id == LogicalKeyboardKey.numpadEnter.keyId ||
          event.id == AttackType.melee) {
        if (gameRef.player != null && gameRef.player?.isDead == true) return;

        simpleAttackMelee(
          withPush: false,
          size: Vector2.all(size.y),
          damage: _damage * 2,
          animationRight: SpriteAnimation.load(
            Globals.cut,
            SpriteAnimationData.sequenced(
              amount: 6,
              stepTime: Globals.spriteStepTime,
              textureSize: Vector2(32, 32),
            ),
          ),
        );
      }
    }

    super.joystickAction(event);
  }
}
