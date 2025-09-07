import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:the_green_ninja/constants/globals.dart';
import 'package:the_green_ninja/decorations/fire.dart';
import 'package:the_green_ninja/enemies/blue_ninja_enemy.dart';
import 'package:the_green_ninja/enemies/dark_ninja_enemy.dart';
import 'package:the_green_ninja/enemies/demon_enemy.dart';
import 'package:the_green_ninja/enums/attack_type.dart';
import 'package:the_green_ninja/enums/map_id.dart';
import 'package:the_green_ninja/main.dart';
import 'package:the_green_ninja/npcs/old_man_npc.dart';
import 'package:the_green_ninja/players/green_ninja_player.dart';
import 'package:the_green_ninja/screens/game_over_screen.dart';
import 'package:the_green_ninja/screens/level_won_screen.dart';
import 'package:the_green_ninja/sprite_sheets/sprite_sheets.dart';

MapId currentMapId = MapId.one;
late Function(MapId) selectMap;

class TheGreenNinjaGame extends StatefulWidget {
  const TheGreenNinjaGame({Key? key}) : super(key: key);

  @override
  State<TheGreenNinjaGame> createState() => _TheGreenNinjaGameState();
}

class _TheGreenNinjaGameState extends State<TheGreenNinjaGame> {
  @override
  void dispose() {
    currentMapId = MapId.one;
    super.dispose();
  }

  @override
  void initState() {
    selectMap = (MapId id) => setState(() => currentMapId = id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (currentMapId) {
      case MapId.one:
      case MapId.two:
      case MapId.three:
        final greenNinjaPlayer = GreenNinjaPlayer(
          position: Vector2(480, 1000),
          spriteSheet: GreenNinjaSpriteSheet.spriteSheet,
        );
        return BonfireWidget(
          onReady: _onReady,
          key: Key(DateTime.now().toIso8601String()),
          overlayBuilderMap: {
            GameOverScreen.id: (context, game) => const GameOverScreen(),
            LevelWonScreen.id: (context, game) => const LevelWonScreen(),
            'mini_map': (context, game) => MiniMap(
                  game: game,
                  margin: const EdgeInsets.all(20),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                )
          },
          initialActiveOverlays: const <String>['mini_map'],
          lightingColorGame: Colors.black.withValues(alpha: 0.5),
          player: greenNinjaPlayer,
          cameraConfig: CameraConfig(
            initPosition: Vector2(
              Globals.defaultTileSize * 5,
              Globals.defaultTileSize * 5,
            ),
            target: greenNinjaPlayer, // Target the player
          ),
          playerControllers: [
            Keyboard(
              config: KeyboardConfig(
                enable: true,
                directionalKeys: [
                  KeyboardDirectionalKeys.arrows(),
                ], // Type of the directional (arrows or wasd)
              ),
            ),
            Joystick(
              directional: JoystickDirectional(),
              actions: [
                JoystickAction(
                  actionId: AttackType.melee,
                  size: 80,
                  margin: const EdgeInsets.only(bottom: 50, right: 50),
                  sprite: Sprite.load(Globals.sword),
                ),
                JoystickAction(
                  actionId: AttackType.range,
                  size: 50,
                  margin: const EdgeInsets.only(bottom: 50, right: 160),
                  sprite: Sprite.load(Globals.shurikenSingle),
                )
              ],
            ),
          ],
          map: WorldMapByTiled(
            WorldMapReader.fromAsset(Globals.mapOne),
            forceTileSize: Vector2(32, 32),
            objectsBuilder: {
              'old_man': (properties) => OldManNpc(
                    position: properties.position,
                    spriteSheet: OldManSpriteSheet.spriteSheet,
                  ),
              'dark_ninja': (properties) => DarkNinjaEnemy(
                    position: properties.position,
                    spriteSheet: DarkNinjaSpriteSheet.spriteSheet,
                  ),
              'demon': (properties) => DemonEnemy(
                    position: properties.position,
                  ),
              'blue_ninja': (properties) => BlueNinjaEnemy(
                    position: properties.position,
                    spriteSheet: BlueNinjaSpriteSheet.spriteSheet,
                  ),
              'fire': (properties) => Fire(
                    position: properties.position,
                  ),
            },
          ),
        );
    }
  }

  void _onReady(BonfireGameInterface bgi) {
    final map = bgi.map;
    final camera = bgi.camera;
    final player = bgi.player;

    logger.d('Game ready!');

    logger.d('Map size: ${map.size}');
    logger.d('Camera bounds: ${camera.viewport.size}');
    logger.d('Player position: ${player?.position}');
  }
}
