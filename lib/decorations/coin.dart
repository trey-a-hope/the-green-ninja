import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';
import 'package:the_green_ninja/screens/level_won_screen.dart';

class Coin extends GameDecoration with Sensor<GreenNinjaPlayer> {
  Coin({required Vector2 position})
      : super.withAnimation(
          animation: SpriteAnimation.load(
            Globals.coin,
            SpriteAnimationData.sequenced(
              amount: 4,
              stepTime: Globals.spriteStepTime,
              textureSize: Vector2(10, 10),
            ),
          ),
          size: Vector2.all(Globals.smallItemSize),
          position: position,
        );

  @override
  void onContact(GameComponent component) {
    if (component is GreenNinjaPlayer) {
      FlameAudio.play(Globals.successSound);
      removeFromParent();
      gameRef.pauseEngine();
      gameRef.overlayManager.add(LevelWonScreen.iD);
    }
  }

  @override
  void onContactExit(GameComponent component) {}
}
