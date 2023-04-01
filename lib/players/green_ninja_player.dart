import 'package:bonfire/bonfire.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';

class GreenNinjaPlayer extends SimplePlayer {
  GreenNinjaPlayer({required Vector2 position})
      : super(
          animation: AnimationConfigs.greenNinjaAnimation,
          size: Vector2.all(Globals.playerSize),
          position: position,
          initDirection: Direction.down,
          speed: Globals.playerSize * 3,
          life: 100,
        );
}
