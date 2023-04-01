import 'package:bonfire/bonfire.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/sprite_sheets/blue_ninja_sprite_sheet.dart';
import 'package:the_green_ninja/sprite_sheets/dark_ninja_sprite_sheet.dart';
import 'package:the_green_ninja/sprite_sheets/green_ninja_sprite_sheet.dart';

class AnimationConfigs {
  AnimationConfigs._();

  static SimpleDirectionAnimation demonCyclopAnimation =
      SimpleDirectionAnimation(
    idleDown: SpriteAnimation.load(
      Globals.demonCyclopIdlSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    runDown: SpriteAnimation.load(
      Globals.demonCyclopWalkSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    idleUp: SpriteAnimation.load(
      Globals.demonCyclopIdlSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    runUp: SpriteAnimation.load(
      Globals.demonCyclopWalkSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    idleLeft: SpriteAnimation.load(
      Globals.demonCyclopIdlSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    runLeft: SpriteAnimation.load(
      Globals.demonCyclopWalkSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    idleRight: SpriteAnimation.load(
      Globals.demonCyclopIdlSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
    runRight: SpriteAnimation.load(
      Globals.demonCyclopWalkSpriteSheet,
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: Globals.spriteStepTime,
        textureSize: Vector2(50, 50),
      ),
    ),
  );

  static SimpleDirectionAnimation darkNinjaAnimation = SimpleDirectionAnimation(
    idleDown: SpriteAnimation.variableSpriteList(
      [DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 0)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runDown: SpriteAnimation.variableSpriteList(
      [
        DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 0),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(1, 0),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(2, 0),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(3, 0),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleUp: SpriteAnimation.variableSpriteList(
      [DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 1)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runUp: SpriteAnimation.variableSpriteList(
      [
        DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 1),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(1, 1),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(2, 1),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(3, 1),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleLeft: SpriteAnimation.variableSpriteList(
      [DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 2)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runLeft: SpriteAnimation.variableSpriteList(
      [
        DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 2),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(1, 2),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(2, 2),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(3, 2),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleRight: SpriteAnimation.variableSpriteList(
      [DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 3)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runRight: SpriteAnimation.variableSpriteList(
      [
        DarkNinjaSpriteSheet.spriteSheet.getSprite(0, 3),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(1, 3),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(2, 3),
        DarkNinjaSpriteSheet.spriteSheet.getSprite(3, 3),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
  );

  static SimpleDirectionAnimation blueNinjaAnimation = SimpleDirectionAnimation(
    idleDown: SpriteAnimation.variableSpriteList(
      [BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 0)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runDown: SpriteAnimation.variableSpriteList(
      [
        BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 0),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(1, 0),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(2, 0),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(3, 0),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleUp: SpriteAnimation.variableSpriteList(
      [BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 1)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runUp: SpriteAnimation.variableSpriteList(
      [
        BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 1),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(1, 1),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(2, 1),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(3, 1),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleLeft: SpriteAnimation.variableSpriteList(
      [BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 2)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runLeft: SpriteAnimation.variableSpriteList(
      [
        BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 2),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(1, 2),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(2, 2),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(3, 2),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleRight: SpriteAnimation.variableSpriteList(
      [BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 3)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runRight: SpriteAnimation.variableSpriteList(
      [
        BlueNinjaSpriteSheet.spriteSheet.getSprite(0, 3),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(1, 3),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(2, 3),
        BlueNinjaSpriteSheet.spriteSheet.getSprite(3, 3),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
  );

  static SimpleDirectionAnimation greenNinjaAnimation =
      SimpleDirectionAnimation(
    idleDown: SpriteAnimation.variableSpriteList(
      [GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runDown: SpriteAnimation.variableSpriteList(
      [
        GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(1, 0),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(2, 0),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(3, 0),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleUp: SpriteAnimation.variableSpriteList(
      [GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 1)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runUp: SpriteAnimation.variableSpriteList(
      [
        GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 1),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(1, 1),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(2, 1),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(3, 1),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleLeft: SpriteAnimation.variableSpriteList(
      [GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 2)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runLeft: SpriteAnimation.variableSpriteList(
      [
        GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 2),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(1, 2),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(2, 2),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(3, 2),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
    idleRight: SpriteAnimation.variableSpriteList(
      [GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 3)],
      stepTimes: [Globals.spriteStepTime],
    ),
    runRight: SpriteAnimation.variableSpriteList(
      [
        GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 3),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(1, 3),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(2, 3),
        GreenNinjaSpriteSheet.spriteSheet.getSprite(3, 3),
      ],
      stepTimes: [
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
        Globals.spriteStepTime,
      ],
    ),
  );
}
