import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';

class Medipack extends GameDecoration with Sensor<GreenNinjaPlayer> {
  final double life = 25;

  Medipack({required Vector2 position})
      : super.withSprite(
          sprite: Sprite.load(Globals.medipack),
          position: position,
          size: Vector2(
            Globals.smallItemSize,
            Globals.smallItemSize,
          ),
        );

  @override
  void onContact(GameComponent component) {
    if (component is GreenNinjaPlayer) {
      FlameAudio.play(Globals.powerUpSound);
      component.addLife(life);
      removeFromParent();
    }
  }

  @override
  void onContactExit(GameComponent component) {}
}
