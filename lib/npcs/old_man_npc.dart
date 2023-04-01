import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/sprite_sheets/sprite_sheets.dart';

class OldManNPC extends SimpleNpc with TapGesture, AutomaticRandomMovement {
  bool _observedPlayer = false;
  late TextPaint _textConfig;

  OldManNPC({
    required Vector2 position,
  }) : super(
          animation: AnimationConfigs.oldManAnimation,
          size: Vector2.all(Globals.playerSize),
          position: position,
          initDirection: Direction.left,
          speed: Globals.playerSize,
        ) {
    _textConfig = TextPaint(
      style: TextStyle(
        color: Colors.white,
        fontSize: width / 2,
      ),
    );
  }

  @override
  void onTap() {
    if (_observedPlayer) {
      _showTalkDialog();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_observedPlayer) {
      _textConfig.render(
        canvas,
        'Well, if it isn\'t Green Ninja.',
        Vector2(x - width / 1.5, center.y - (height + 5)),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    seeAndMoveToPlayer(
      closePlayer: (player) {},
      radiusVision: Globals.radiusVision,
      observed: () {
        if (!_observedPlayer) {
          _observedPlayer = true;
        }
      },
      notObserved: () {
        _observedPlayer = false;
        runRandomMovement(
          dt,
          maxDistance: Globals.observeMaxDistance,
          minDistance: Globals.observeMinDistance,
        );
      },
    );
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
