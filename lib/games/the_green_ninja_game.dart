import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/enemies/blue_ninja_enemy.dart';
import 'package:the_green_ninja/enemies/dark_ninja_enemy.dart';
import 'package:the_green_ninja/enemies/demon_cyclop_enemy.dart';
import 'package:the_green_ninja/enums/attack_type.dart';
import 'package:the_green_ninja/npcs/old_man_npc.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';
import '../sprite_sheets/sprite_sheets.dart';

class TheGreenNinjaGame extends StatefulWidget {
  const TheGreenNinjaGame({Key? key}) : super(key: key);

  @override
  State<TheGreenNinjaGame> createState() => _TheGreenNinjaGameState();
}

class _TheGreenNinjaGameState extends State<TheGreenNinjaGame> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          acceptedKeys: [
            LogicalKeyboardKey.numpadEnter,
            LogicalKeyboardKey.numpad0,
          ],
        ),
        actions: [
          JoystickAction(
            actionId: AttackType.melee,
            sprite: Sprite.load(Globals.sword),
            align: JoystickActionAlign.BOTTOM_RIGHT,
            size: 80,
            margin: const EdgeInsets.only(bottom: 50, right: 50),
          ),
          JoystickAction(
            actionId: AttackType.range,
            sprite: Sprite.load(Globals.shurikenSingle),
            size: 50,
            margin: const EdgeInsets.only(bottom: 50, right: 160),
          )
        ],
      ),
      player: GreenNinjaPlayer(
        spriteSheet: GreenNinjaSpriteSheet.spriteSheet,
        position: Vector2(40, 40),
      ),
      map: WorldMapByTiled(
        Globals.mapOne,
        forceTileSize: Vector2(
          Globals.defaultTileSize,
          Globals.defaultTileSize,
        ),
        objectsBuilder: {
          'old_man': (TiledObjectProperties properties) => OldManNPC(
                position: properties.position,
                spriteSheet: OldManSpriteSheet.spriteSheet,
              ),
          'dark_ninja': (TiledObjectProperties properties) => DarkNinjaEnemy(
                position: properties.position,
                spriteSheet: DarkNinjaSpriteSheet.spriteSheet,
              ),
          'blue_ninja': (TiledObjectProperties properties) => BlueNinjaEnemy(
                position: properties.position,
                spriteSheet: BlueNinjaSpriteSheet.spriteSheet,
              ),
          'demon': (TiledObjectProperties properties) => DemonCyclopEnemy(
                position: properties.position,
              ),
        },
      ),
    );
  }
}
