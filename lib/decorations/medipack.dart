import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';

class Medipack extends GameDecoration with Sensor<GreenNinjaPlayer> {
  final double _life = 25;

  Medipack({required Vector2 position})
      : super.withSprite(
          sprite: Sprite.load(Globals.medipack),
          position: position,
          size: Vector2.all(Globals.smallItemSize),
        );

  @override
  void onContact(GameComponent component) {
    FlameAudio.play(Globals.powerUpSound);
    removeFromParent();
    gameRef.player!.addLife(_life);
  }
}
