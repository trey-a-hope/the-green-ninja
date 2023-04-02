import 'package:bonfire/bonfire.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/sprite_sheets/sprite_sheets.dart';

class AnimationConfigs {
  AnimationConfigs._();

  static Future<SpriteAnimation> fireBallAnimation() => SpriteAnimation.load(
        Globals.fireBall,
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: Globals.spriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> shurikenAnimation() => SpriteAnimation.load(
        Globals.shuriken,
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: Globals.spriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> smokeAnimation() => SpriteAnimation.load(
        Globals.smoke,
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: Globals.spriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> cutAnimation() => SpriteAnimation.load(
        Globals.cut,
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: Globals.spriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> shurikenMagicAnimation() =>
      SpriteAnimation.load(
        Globals.shurikenMagic,
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: Globals.spriteStepTime,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> bigEnergyBallAnimation() =>
      SpriteAnimation.load(
        Globals.bigEnergyBall,
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: Globals.spriteStepTime,
          textureSize: Vector2(24, 24),
        ),
      );

  static SimpleDirectionAnimation demonCyclopAnimation() =>
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

  static SimpleDirectionAnimation oldManAnimation({
    required SpriteSheet spriteSheet,
  }) =>
      SimpleDirectionAnimation(
        idleDown: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 0)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runDown: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 0),
            spriteSheet.getSprite(1, 0),
            spriteSheet.getSprite(2, 0),
            spriteSheet.getSprite(3, 0),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleUp: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 1)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runUp: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 1),
            spriteSheet.getSprite(1, 1),
            spriteSheet.getSprite(2, 1),
            spriteSheet.getSprite(3, 1),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleLeft: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 2)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runLeft: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 2),
            spriteSheet.getSprite(1, 2),
            spriteSheet.getSprite(2, 2),
            spriteSheet.getSprite(3, 2),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleRight: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 3)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runRight: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 3),
            spriteSheet.getSprite(1, 3),
            spriteSheet.getSprite(2, 3),
            spriteSheet.getSprite(3, 3),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
      );

  static SimpleDirectionAnimation darkNinjaAnimation({
    required SpriteSheet spriteSheet,
  }) =>
      SimpleDirectionAnimation(
        idleDown: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 0)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runDown: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 0),
            spriteSheet.getSprite(1, 0),
            spriteSheet.getSprite(2, 0),
            spriteSheet.getSprite(3, 0),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleUp: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 1)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runUp: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 1),
            spriteSheet.getSprite(1, 1),
            spriteSheet.getSprite(2, 1),
            spriteSheet.getSprite(3, 1),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleLeft: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 2)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runLeft: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 2),
            spriteSheet.getSprite(1, 2),
            spriteSheet.getSprite(2, 2),
            spriteSheet.getSprite(3, 2),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleRight: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 3)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runRight: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 3),
            spriteSheet.getSprite(1, 3),
            spriteSheet.getSprite(2, 3),
            spriteSheet.getSprite(3, 3),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
      );

  static SimpleDirectionAnimation blueNinjaAnimation({
    required SpriteSheet spriteSheet,
  }) =>
      SimpleDirectionAnimation(
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

  static SimpleDirectionAnimation greenNinjaAnimation({
    required SpriteSheet spriteSheet,
  }) =>
      SimpleDirectionAnimation(
        idleDown: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 0)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runDown: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 0),
            spriteSheet.getSprite(1, 0),
            spriteSheet.getSprite(2, 0),
            spriteSheet.getSprite(3, 0),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleUp: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 1)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runUp: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 1),
            spriteSheet.getSprite(1, 1),
            spriteSheet.getSprite(2, 1),
            spriteSheet.getSprite(3, 1),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleLeft: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 2)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runLeft: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 2),
            spriteSheet.getSprite(1, 2),
            spriteSheet.getSprite(2, 2),
            spriteSheet.getSprite(3, 2),
          ],
          stepTimes: [
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
            Globals.spriteStepTime,
          ],
        ),
        idleRight: SpriteAnimation.variableSpriteList(
          [spriteSheet.getSprite(0, 3)],
          stepTimes: [Globals.spriteStepTime],
        ),
        runRight: SpriteAnimation.variableSpriteList(
          [
            spriteSheet.getSprite(0, 3),
            spriteSheet.getSprite(1, 3),
            spriteSheet.getSprite(2, 3),
            spriteSheet.getSprite(3, 3),
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
