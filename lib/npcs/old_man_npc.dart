import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/sprite_sheets/sprite_sheets.dart';

class OldManNPC extends SimpleNpc with TapGesture {
  OldManNPC({
    required Vector2 position,
  }) : super(
          animation: AnimationConfigs.oldManAnimation,
          size: Vector2.all(Globals.playerSize),
          position: position,
          initDirection: Direction.left,
          speed: Globals.playerSize,
        );

  @override
  void onTap() {
    _showTalkDialog();
  }

  Say speak({required String text, required bool isHero}) => Say(
        text: [
          TextSpan(
            text: text,
          )
        ],
        person: SizedBox(
          width: Globals.dialogBox,
          height: Globals.dialogBox,
          child: isHero
              ? GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0).asWidget()
              : OldManSpriteSheet.spriteSheet.getSprite(0, 0).asWidget(),
        ),
        personSayDirection:
            isHero ? PersonSayDirection.LEFT : PersonSayDirection.RIGHT,
      );

  void _showTalkDialog() {
    gameRef.camera.moveToTargetAnimated(
      this,
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            speak(isHero: false, text: 'Hello, Green Ninja. Are you lost?'),
            speak(
                isHero: true,
                text: 'Greetings old man, I\'m well. Looking for the coin.'),
            speak(
                isHero: false, text: 'Ah, the coin. The Blue Ninja has that.'),
            speak(isHero: true, text: 'Say less.'),
          ],
          onClose: () {
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }
}
