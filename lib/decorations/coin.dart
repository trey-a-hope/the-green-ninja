import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';
import 'package:the_green_ninja/screens/level_won_screen.dart';

class Coin extends GameDecoration with Sensor<GreenNinjaPlayer> {
  Coin({required Vector2 position})
      : super.withAnimation(
          animation: AnimationConfigs.coinAnimation(),
          position: position,
          size: Vector2.all(Globals.smallItemSize),
        );

  @override
  void onContact(GameComponent component) {
    FlameAudio.play(Globals.successSound);
    removeFromParent();
    gameRef.pauseEngine();
    gameRef.overlayManager.add(LevelWonScreen.id);
  }
}
