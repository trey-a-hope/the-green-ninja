import 'package:bonfire/bonfire.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';

class OldManNPC extends SimpleNpc {
  OldManNPC({
    required Vector2 position,
  }) : super(
          animation: AnimationConfigs.oldManAnimation,
          size: Vector2.all(Globals.playerSize),
          position: position,
          initDirection: Direction.left,
          speed: Globals.playerSize,
        );
}
