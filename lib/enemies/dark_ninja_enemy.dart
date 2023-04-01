import 'package:bonfire/bonfire.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';

class DarkNinjaEnemy extends SimpleEnemy {
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
        );
}
