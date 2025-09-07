import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/animation_configs.dart';
import 'package:the_green_ninja/constants/globals.dart';
// import 'package:the_green_ninja/sprite_sheets/sprite_sheets.dart';

class OldManNpc extends SimpleNpc with TapGesture, RandomMovement {
  bool _observed = false;
  late TextPaint _textPaint;

  OldManNpc({required Vector2 position, required SpriteSheet spriteSheet})
      : super(
          position: position,
          size: Vector2(Globals.playerSize, Globals.playerSize),
          speed: 100,
          initDirection: Direction.down,
          animation: AnimationConfigs.oldManAnimation(spriteSheet: spriteSheet),
        ) {
    _textPaint = TextPaint(
      style: TextStyle(color: Colors.white, fontSize: width / 2),
    );
  }

  @override
  void onTap() {
    _showDialogTalk();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (_observed) {
      _textPaint.render(
        canvas,
        'Hey Green Ninja!',
        Vector2(position.x - 30, position.y - 30),
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
        if (!_observed) {
          _observed = true;
        }
      },
      notObserved: () {
        _observed = false;

        runRandomMovement(
          dt,
          maxDistance: Globals.observeMaxDistance,
          minDistance: Globals.observeMinDistance,
        );

        return _observed;
      },
    );
  }

  void _showDialogTalk() {
    // gameRef.camera.moveToTargetAnimated(
    //   this,
    //   zoom: 2,
    //   finish: () {
    //     TalkDialog.show(gameRef.context, [
    //       _speak(text: 'Hey wassup Green Nina, are you lost?', isHero: false),
    //       _speak(
    //           text:
    //               'Hello Old Man, pleasure seeing you. Do you know where the coin is?',
    //           isHero: true),
    //       _speak(text: 'Ah yes, the blue ninja has the coin.', isHero: false),
    //       _speak(text: 'Say less.', isHero: true),
    //     ], logicalKeyboardKeysToNext: [
    //       LogicalKeyboardKey.space,
    //       LogicalKeyboardKey.enter,
    //     ], onClose: () {
    //       gameRef.camera.moveToPlayerAnimated(zoom: 1);
    //     });
    //   },
    // );
  }

  // Say _speak({required String text, required bool isHero}) => Say(
  //       text: [
  //         TextSpan(text: text),
  //       ],
  //       person: SizedBox(
  //         height: Globals.dialogBox,
  //         width: Globals.dialogBox,
  //         child: isHero
  //             ? GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0).asWidget()
  //             : OldManSpriteSheet.spriteSheet.getSprite(0, 0).asWidget(),
  //       ),
  //       personSayDirection:
  //           isHero ? PersonSayDirection.LEFT : PersonSayDirection.RIGHT,
  //     );
}
